import wso2/cassandra as c;

final int port = 9142;
final string host = "localhost";
final string username = "cassandra";
final string password = "cassandra";

function testConnectionInitWithLBPolicy() {
    c:Client conn = new({
        host: "localhost",
        port: 9142,
        username: "cassandra",
        password: "cassandra",
        options: { loadBalancingPolicy: "DCAwareRoundRobinPolicy" }
    });
    checkpanic conn->update("CREATE KEYSPACE lbtestkeyspace  WITH replication = {'class': 'SimpleStrategy',
    'replication_factor' :1}");
    conn.stop();
}

function testConnectionInitWithInvalidLBPolicy() {
    c:Client conn = new({
        host: "localhost",
        port: 9142,
        username: "cassandra",
        password: "cassandra",
        options: { loadBalancingPolicy: "InvalidRoundRobinPolicy" }
    });
}

function testConnectionInitWithRetryPolicy() {
    c:Client conn = new({
        host: "localhost",
        port: 9142,
        username: "cassandra",
        password: "cassandra",
        options: { retryPolicy: "DefaultRetryPolicy" }
    });

    checkpanic conn->update("CREATE KEYSPACE retrytestkeyspace  WITH replication = {'class': 'SimpleStrategy', 'replication_factor':
    1}");
    conn.stop();
}

function testConnectionInitWithInvalidRetryPolicy() {
    c:Client conn = new({
        host: "localhost",
        port: 9142,
        username: "cassandra",
        password: "cassandra",
        options: { retryPolicy: "InvalidRetryPolicy" }
    });
    conn.stop();
}

function testConnectionInitWithReconnectionPolicy() {
    c:Client conn = new({
        host: "localhost",
        port: 9142,
        username: "cassandra",
        password: "cassandra",
        options: { reconnectionPolicy: "ConstantReconnectionPolicy", constantReconnectionPolicyDelay: 500 }
    });

    checkpanic conn->update("CREATE KEYSPACE reconnectiontestkeyspace  WITH replication = {'class': 'SimpleStrategy',
    'replication_factor': 1}");
    conn.stop();
}

function testConnectionInitWithInvalidReconnectionPolicy() {
    c:Client conn = new({
        host: "localhost",
        port: 9142,
        username: "cassandra",
        password: "cassandra",
        options: { reconnectionPolicy: "InvalidReconnectionPolicy", constantReconnectionPolicyDelay: 500 }
    });
}

function testConnectionInitWithInvalidConsistencyLevel() {
    c:Client conn = new({
        host: "localhost",
        port: 9142,
        username: "cassandra",
        password: "cassandra",
        options: { queryOptionsConfig: {
            consistencyLevel: "INVALID_LEVEL" } }
    });

}

function testConnectionInitWithInvalidSerialConsistencyLevel() {
    c:Client conn = new({
        host: "localhost",
        port: 9142,
        username: "cassandra",
        password: "cassandra",
        options: { queryOptionsConfig: {
            serialConsistencyLevel: "ONE" } }
    });
}


function testConnectionInitWithPoolingOptions() {
    c:Client conn = new({
        host: "localhost",
        port: 9142,
        username: "cassandra",
        password: "cassandra",
        options: { poolingOptionsConfig: {
            maxRequestsPerConnectionLocal: 1, maxRequestsPerConnectionRemote: 128, idleTimeoutSeconds: 120,
            poolTimeoutMillis: 100, maxQueueSize: 256, heartbeatIntervalSeconds: 30,
            coreConnectionsPerHostLocal: 2, maxConnectionsPerHostLocal: 2, newConnectionThresholdLocal: 100,
            coreConnectionsPerHostRemote: 1, maxConnectionsPerHostRemote: 8,
            newConnectionThresholdRemote: 100 } } });
    checkpanic conn->update("CREATE KEYSPACE poolingoptionstestkeyspace  WITH replication = {'class': 'SimpleStrategy',
        'replication_factor': 1}");
    conn.stop();

}


function testConnectionInitWithSocketOptions() {
    c:Client conn = new({
        host: "localhost",
        port: 9142,
        username: "cassandra",
        password: "cassandra",
        options: { socketOptionsConfig: {
            connectTimeoutMillis: 5000, readTimeoutMillis: 12000, soLinger: 0 } }
    });
    checkpanic conn->update("CREATE KEYSPACE socketoptionstestkeyspace  WITH replication = {'class': 'SimpleStrategy',
    'replication_factor': 1}");
    conn.stop();
}

function testConnectionInitWithQueryOptions() {
    c:Client conn = new({
        host: "localhost",
        port: 9142,
        username: "cassandra",
        password: "cassandra",
        options: { queryOptionsConfig: {
            consistencyLevel: "ONE", serialConsistencyLevel: "LOCAL_SERIAL", defaultIdempotence: false, metadataEnabled:
        true, reprepareOnUp: true, prepareOnAllHosts: true, fetchSize: 5000, maxPendingRefreshNodeListRequests: 20,
            maxPendingRefreshNodeRequests: 20, maxPendingRefreshSchemaRequests: 20, refreshNodeListIntervalMillis: 1000,
            refreshNodeIntervalMillis: 1000, refreshSchemaIntervalMillis: 1000 } }
    });
    checkpanic conn->update("CREATE KEYSPACE queryoptionstestkeyspace  WITH replication = {'class': 'SimpleStrategy',
    'replication_factor': 1}");
    conn.stop();
}

function testConnectionInitWithProtocolOptions() {
    c:Client conn = new({
        host: "localhost",
        port: 9142,
        username: "cassandra",
        password: "cassandra",
        options: { protocolOptionsConfig: {
            sslEnabled: false, noCompact: false, maxSchemaAgreementWaitSeconds: 10, compression: "NONE",
            initialProtocolVersion: "V4" } }
    });

    checkpanic conn->update("CREATE KEYSPACE protocoloptionstestkeyspace  WITH replication = {'class': 'SimpleStrategy',
    'replication_factor' :1}");
    conn.stop();
}

function testConnectionInitWithAdditionalConnectionParams() {
    c:Client conn = new({
        host: "localhost",
        port: 9142,
        username: "cassandra",
        password: "cassandra",
        options: { clusterName: "Maze", withoutMetrics:
        false, withoutJMXReporting: false, allowRemoteDCsForLocalConsistencyLevel: false }
    });

    checkpanic conn->update("CREATE KEYSPACE conparamtestkeyspace  WITH replication = {'class': 'SimpleStrategy',
    'replication_factor': 1}");
    conn.stop();
}






