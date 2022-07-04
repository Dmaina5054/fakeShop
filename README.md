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
<p>By defining a client class, we set Base Url, Connection Timeout, Receive Timeout and other options. This way, we don't have to send the parameters in every request</p>