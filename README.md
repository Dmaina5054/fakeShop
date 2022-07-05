# fakeshop

## Getting Started

This project is shows how to implement network calls to API resources.
We use Dio package to make relevant network calls and perform crud operations

<h2>Architecture</h2>
<ul>
<li>Data: Contains all networking related modules</li>
<li>DI: To implement Depedency Injection</li>
<li>UI: COntains Screens and Widgets</li>

</ul>

<h2><a href="https://fakestoreapi.com/docs">FakeStore API</a></h2>
<p>We will use the fakestore api which provides GET, POST, PUT & DELETE resources</p>

<h2>DioClient</h2>
<p>To send an api request to the server, we shall need to create a Client. The Client will perform the network calls and then send us response results</p>
<p>By defining a client class, we set Base Url, Connection Timeout, Receive Timeout and other options. This way, we don't have to send the parameters in every request.</p>

<h2>API Request Class</h2>

In this class we define all our API Request.The methods interact with the Dio Client's methods and returns RAW data.

<h2>Repository</h2>
Since our API Request class returns RAW data, we need to convert this data based on our model definition. So we define this behavior in a Repository Class.


<h2>Error Handling</h2>
In the Repository Class, we define a DioException Class for catching the DioError.
This class will convert the Error thrown to a readable error message.


<h2>Depedency Injection</h2>
To inject the singleton classes we use the <a href="https://pub.dev/packages/get_it">GetIt</a> Package. Through <a href="https://dhruvnakum.xyz/master-the-art-of-dependency-injection">depedency injection</a>, we ensure that our code is loosely coupled and our classes are not highly indepedent on each other.
In our scenario, the Product Repository depends on the Product API class.
Additionaly, our Dio Client class depends on the Dio Class.

<h2>Building the UI</h2>
We build a minimalistic UI that has a Product Page with a list of Products. We use FutureBuilder to get the list of products.
In our UI, we either show the data returned or an Error.



