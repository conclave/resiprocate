########################################################
# repro configuration file
########################################################


########################################################
# Log settings
########################################################

# Logging Type: syslog|cerr|cout|file
# Note:  Logging to cout can negatively effect performance.
#        When repro is placed into production 'file' or 
#        'syslog' should be used.
LoggingType = cout

# Logging level: NONE|CRIT|ERR|WARNING|INFO|DEBUG|STACK
LogLevel = INFO

# Log Filename
LogFilename = repro.log

# Log file Max Bytes
LogFileMaxBytes = 5242880

# Instance name to be shown in logs, very useful when multiple instances
# logging to syslog concurrently
# If unspecified, defaults to argv[0] (name of the executable)
#LoggingInstanceName = repro-dev

########################################################
# Transport settings
########################################################

# Set an upper limit on the maximum size of a SIP message payload
# that the stack will accept.  If a payload received over a
# connection-oriented transport exceeds this size, the
# connection will be dropped.
# This applies to TCP, TLS and WebSocket transports.
# UDP payload sizes are limited by the maximum datagram size
# and any fragmentation constraints.
#StreamMessageSizeLimit = 65536

# Local IP Address to bind SIP transports to. If left blank
# repro will bind to all adapters.
#IPAddress = 192.168.1.106
#IPAddress = 2001:5c0:1000:a::6d
IPAddress =

# Local port to listen on for SIP messages over UDP - 0 to disable
UDPPort = 5060

# Local port to listen on for SIP messages over TCP - 0 to disable
TCPPort = 5060

# Local port to listen on for SIP messages over TLS - 0 to disable
TLSPort = 0

# Local port to listen on for SIP messages over WS (WebSocket) - 0 to disable
WSPort = 80
 
# Local port to listen on for SIP messages over WSS (WebSocket TLS) - 0 to disable
WSSPort = 0

# Local port to listen on for SIP messages over DTLS - 0 to disable
DTLSPort = 0

# TLS domain name for this server (note: domain cert for this domain must be present)
TLSDomainName =

# PEM-encoded X.509 certificate for TLS
# Must contain any intermediate certificates from the CA
# The TLSCertificate and TLSPrivateKey parameters are optional.  The stack
# will also try to automatically detect any suitable certificates
# in the directory specified by CertificatePath
TLSCertificate = 

# PEM-encoded private key for TLS
TLSPrivateKey = 

# Whether or not we ask for (Optional) or expect (Mandatory) TLS
# clients to present a client certificate
# Possible values:
#  None: client can connect without any cert, if a cert is sent, it is not checked
#  Optional: client can connect without any cert, if a cert is sent, it must be acceptable to us
#  Mandatory: client can not connect without any cert, cert must be acceptable to us
# How we decide if a cert is acceptable: it must meet two criteria:
# 1. it must be signed by a CA that we trust (see CADirectory)
# 2. the domain or full sip: URI in the cert must match the From: URI of all
#    SIP messages coming from the peer
TLSClientVerification = None

# Whether we accept the subjectAltName email address as if it was a SIP
# address (when checking the validity of a client certificate)
# Very few commercial CAs offer support for SIP addresses in subjectAltName
# For many purposes, an email address subjectAltName may be considered
# equivalent within a specific domain.
# Currently, this accepts such certs globally (for any incoming connection),
# not just for connections from the local users.
TLSUseEmailAsSIP = false

# Alternate and more flexible method to specify transports to bind to.  If specified here
# then IPAddress, and port settings above are ignored.
# Transports MUST be numbered in sequential order, starting from 1.  Possible settings are:
# Transport<Num>Interface = <IPAddress>:<Port> - Note:  For IPv6 addresses last colon separates
#                                                IP Address and Port - square bracket notation
#                                                is not used.
# Transport<Num>Type = <'TCP'|'UDP'|'TLS'|'DTLS'|'WS'|'WSS'> - default is UDP if missing
# Transport<Num>TlsDomain = <TLSDomain> - only required if transport is TLS, DTLS or WSS
# Transport<Num>TlsCertificate = <TLSCertificate> - only for TLS, DTLS or WSS
# Transport<Num>TlsPrivateKey = <TLSPrivateKey> - only for TLS, DTLS or WSS
# Transport<Num>TlsClientVerification = <'None'|'Optional'|'Mandatory'> - default is None
# Transport<Num>RecordRouteUri = <'auto'|URI> - if set to auto then record route URI
#                                               is automatically generated from the other
#                                               transport settings.  Otherwise explicity
#                                               enter the full URI you want repro to use.
#                                               Do not specify 'auto' if you specified
#                                               the IPAddress as INADDR_ANY (0.0.0.0).
#                                               If nothing is specified then repro will
#                                               use the global RecordRouteUri setting.
#
# Transport<Num>RcvBufLen = <SocketReceiveBufferSize> - currently only applies to UDP transports,
#                                                       leave empty to use OS default
# Example:
# Transport1Interface = 192.168.1.106:5060
# Transport1Type = TCP
# Transport1RecordRouteUri = auto
#
# Transport2Interface = 192.168.1.106:5060
# Transport2Type = UDP
# Transport2RecordRouteUri = auto
# Transport2RcvBufLen = 10000
#
# Transport3Interface = 192.168.1.106:5061
# Transport3Type = TLS
# Transport3TlsDomain = sipdomain.com
# Transport3TlsCertificate = /etc/ssl/crt/sipdomain.com.crt
# Transport3TlsPrivateKey = /etc/ssl/private/sipdomain.com.key
# Transport3TlsClientVerification = Mandatory
# Transport3RecordRouteUri = sip:h1.sipdomain.com;transport=TLS
#
# Transport4Interface = 2666:f0d0:1008:88::4:5060
# Transport4Type = UDP
# Transport4RecordRouteUri = auto

# Transport5Interface = 192.168.1.106:5062
# Transport5Type = WS
# Transport5RecordRouteUri = auto

# Transport6Interface = 192.168.1.106:5063
# Transport6Type = WSS
# Transport6TlsDomain = sipdomain.com
# Transport6TlsClientVerification = None
# Transport6RecordRouteUri = sip:h1.sipdomain.com;transport=WS

# Comma separated list of DNS servers, overrides default OS detected list (leave blank 
# for default)
DNSServers =

# Enable IPv6
EnableIPv6 = true

# Enable IPv4
DisableIPv4 = false

# Comma separated list of IP addresses used for binding the HTTP configuration interface
# and/or certificate server. If left blank it will bind to all adapters.
HttpBindAddress =

# Port on which to run the HTTP configuration interface and/or certificate server 
# 0 to disable (default: 5080)
HttpPort = 5080

# disable HTTP challenges for web based configuration GUI
DisableHttpAuth = false

# Realm to use for HTTP admin interface digest authentication
HttpAdminRealm = repro

# File containing user/password details
# 
# The format is:
#
#   username:realm:HA1
#
# where
#
#   user = admin
#   realm = the value from HttpAdminRealm
#   HA1 = `echo -n user:realm:password | md5sum`
#
# You can use the htdigest utility from Apache to create and
# manage this file 
#
HttpAdminUserFile = users.txt

# Comma separated list of IP addresses used for binding the Command Server listeners.
# If left blank it will bind to all adapters.
CommandBindAddress =

# Port on which to listen for and send XML RPC messaging used in command processing 
# 0 to disable (default: 5081)
CommandPort = 5081

# Port on which to listen for and send XML RPC messaging used in registration sync 
# process - 0 to disable (default: 0)
RegSyncPort = 0

# Hostname/ip address of another instance of repro to synchronize registrations with 
# (note xmlrpcport must also be specified)
RegSyncPeer =

# Non-outbound connections over this age (expressed in seconds) are
# considered eligible for garbage collection.
# If not set but FlowTimer is set, then this value defaults to 7200 seconds
# Otherwise, there is no garbage collection at all unless an error occurs
# when making an outgoing connection.
#TCPConnectionGCAge =

# File descriptor headroom threshold for emergency garbage collection
# If the difference between the number of permitted FDs
# (reported by periodic calls to getrlimit()) and the number
# of active stream connections falls below this threshold,
# the garbage collector will overlook TCPConnectionGCAge and
# FlowTimer settings and more aggressively close connections
# By default, this feature is not enabled
# Remember that the value must be high enough to allow file descriptors
# for each shared library that is open, each database connection,
# each listening socket and any sockets/files accessed by plugins
#TCPMinimumGCHeadroom =

########################################################
# Misc settings
########################################################

# Directory where plugins are located
# The default is determined at build time depending upon the
# target environment and the installation prefix passed to
# the configure script
#PluginDirectory = /usr/lib/repro/plugins

# List of plugins to load (comma-separated list)
# These are the names of the plugins and not the full filenames
# Order is important: the plugins will always be loaded and
# initialized in the order specified here
# Plugins are not supported on all platforms and plugin support is an
# optional feature that must be enabled at compile time.
#
# For example, to load  the plugin named "example", which is in libexample.so:
#LoadPlugins = example

# Drop privileges and run as some other user and group
# If RunAsUser is specified and RunAsGroup is not specified,
# then setgid will be invoked using the default group for
# the specified user
# If neither option is specified, then no attempt will be made
# to call setuid/setgid (there is no default value)
#RunAsUser = repro
#RunAsGroup = repro

# Must be true or false, default = false, not supported on Windows
Daemonize = false

# On UNIX it is normal to create a PID file
# if unspecified, no attempt will be made to create a PID file
#PidFile = /var/run/repro/repro.pid

# Path to load certificates from (optional, there is no default)
# Note that repro loads ALL root certificates found by any of the settings
#
#    CADirectory
#    CAFile
#    CertificatePath
#
# Setting one option does not disable the other options.
#
# Path to load root certificates from
# Iff this directory is specified, all files in the directory
# will be loaded as root certificates, prefixes and suffixes are
# not considered
# Note that repro loads ALL root certificates found by the settings
# CertificatePath, CADirectory and CAFile.  Setting one option does
# not disable the other options.
# On Debian, the typical location is /etc/ssl/certs
# On Red Hat/CentOS, there isn't a directory like this.
#CADirectory = /etc/ssl/certs

# Specify a single file containing one or more root certificates
# and possible chain/intermediate certificates to be loaded
# Iff this filename is specified, the certificates in the file will
# be loaded as root certificates
#
# This option is typically used to load a bundle of certificates
# such as /etc/ssl/certs/ca-certificates.crt on Debian and
# /etc/pki/tls/cert.pem on Red Hat/CentOS
#
# Note that repro loads ALL root certificates found by the settings
# CertificatePath, CADirectory and CAFile.  Setting one option does
# not disable the other options.
#
# Uncomment for Debian/Ubuntu:
#CAFile = /etc/ssl/certs/ca-certificates.crt
# Uncomment for Fedora, Red Hat, CentOS:
#CAFile = /etc/pki/tls/cert.pem

# Certificates in this location have to match one of the filename
# patterns expected by the legacy reSIProcate SSL code:
#
#   domain_cert_NAME.pem, root_cert_NAME.pem, ...
#
# For domain certificates, it is recommended to use the options
# for individual transports, such as TransportXTlsCertificate and
# TransportXTlsPrivateKey and not set CertificatePath at all.
#
CertificatePath =

# This option specifies flags to be passed to OpenSSL's
# SSL_CTX_set_options method after creating the SSL context
# for a transport.
#
# The flags here are added (logical OR) to any existing flags already
# set by default within the OpenSSL stack.
#
# By default, the reSIProcate stack adds flags SSL_OP_NO_SSLv2
# and SSL_OP_NO_SSLv3 which disable deprecated and insecure
# SSL versions.  To add more flags, uncomment the line below and add
# the flags required, separated by commas.
#OpenSSLCTXSetOptions = SSL_OP_NO_SSLv2, SSL_OP_NO_SSLv3

# This option specifies flags to be passed to OpenSSL's
# SSL_CTX_clear_options method after creating the SSL context
# for a transport.
#
# The flags here are removed from any existing flags
# already set by default within the OpenSSL stack.
#
# To clear the option SSL_OP_NO_SSLv3 and get SSLv3 support
# (not recommended for security reasons), uncomment the example below:
#OpenSSLCTXClearOptions = SSL_OP_NO_SSLv3

# This parameter specifies the cipher list to be passed to
# SSL_CTX_set_cipher_list.
# The default value is defined in the code as BaseSecurity::StrongestSuite
# using the value HIGH:!aNULL:!eNULL
# Uncomment the line below and add or remove cipher names as required.
# See https://www.openssl.org/docs/apps/ciphers.html for details
# of the format of this parameter.
#OpenSSLCipherList = HIGH:!aNULL:!eNULL
#
# and a weaker cipher list suitable for US export:
#OpenSSLCipherList = EXPORT:!aNULL:!eNULL

# The Path to read and write Berkely DB database files
DatabasePath = ./

# The hostname running MySQL server to connect to, leave blank to use BerkelyDB.
# The value of host may be either a host name or an IP address. If host is "localhost",
# a connection to the local host is assumed. For Windows, the client connects using a
# shared-memory connection, if the server has shared-memory connections enabled. Otherwise,
# TCP/IP is used. For Unix, the client connects using a Unix socket file. For a host value of
# "." on Windows, the client connects using a named pipe, if the server has named-pipe
# connections enabled. If named-pipe connections are not enabled, an error occurs.
# WARNING: repro must be compiled with the USE_MYSQL flag in order for this work.
MySQLServer =

# The MySQL login ID to use when connecting to the MySQL Server. If user is empty string "",
# the current user is assumed. Under Unix, this is the current login name. Under Windows,
# the current user name must be specified explicitly.
MySQLUser = root

# The password for the MySQL login ID specified.
MySQLPassword = root

# The database name on the MySQL server that contains the repro tables
MySQLDatabaseName = repro

# If port is not 0, the value is used as the port number for the TCP/IP connection. Note that
# the host parameter determines the type of the connection.
MySQLPort = 3306

# The Users and MessageSilo database tables are different from the other repro configuration
# database tables, in that they are accessed at runtime as SIP requests arrive.  It may be
# desirable to use BerkeleyDb for the other repro tables (which are read at starup time, then 
# cached in memory), and MySQL for the runtime accessed tables; or two seperate MySQL instances 
# for these different table sets.  Use the following settings in order to specify a seperate 
# MySQL instance for use by the Users and MessageSilo tables.
#
# WARNING: repro must be compiled with the USE_MYSQL flag in order for this work.
# 
# Note:  If this setting is left blank then repro will fallback all remaining my sql
# settings to use the global MySQLServer settings.  If the MySQLServer setting is also
# blank, then repro will use BerkelyDB for all configuration tables.  See the 
# documentation on the global MySQLServer settings for more details on the following 
# individual settings.
RuntimeMySQLServer =
RuntimeMySQLUser = root
RuntimeMySQLPassword = root
RuntimeMySQLDatabaseName = repro
RuntimeMySQLPort = 3306

# If you would like to be able to authenticate users from a MySQL source other than the repro user
# database table itself, then specify the query here.  The following conditions apply:
# 1.  The database table must reside on the same MySQL server instance as the repro database
#     or Runtime tables database.
# 2.  The statement provided will be UNION'd with the hardcoded repro query, so that auth from
#     both sources is possible.  Note:  If the same user exists in both tables, then the repro
#     auth info will be used.
# 3.  The provided SELECT statement must return the SIP A1 password hash of the user in question.
# 4.  The provided SELECT statement must contain two tags embedded into the query: $user and $domain
#     These tags should be used in the WHERE clause, and repro will replace these tags with the
#     actual user and domain being queried.
# Example:  SELECT sip_password_ha1 FROM directory.users WHERE sip_userid = '$user' AND 
#           sip_domain = '$domain' AND account_status = 'active'
MySQLCustomUserAuthQuery =

# Session Accounting - When enabled resiprocate will push a JSON formatted 
# events for sip session related messaging that the proxy receives,
# to a persistent message queue that uses berkeleydb backed storage.
# The following session events are logged:
#   Session Created - INVITE passing authentication was received
#   Session Routed - received INVITE was forward to a target
#   Session Redirected - session was 3xx redirected or REFERed
#   Session Established - there was 2xx answer to an INVITE (only generate for first 2xx)
#   Session Cancelled - CANCEL was received
#   Session Ended - BYE was received from either end
#   Session Error - a 4xx, 5xx, or 6xx response was sent to the inviter
# Consuming Accounting Events:
# Users must ensure that this message queue is consumed, or it will grow without
# bound.  A queuetostream consumer process is provided, that will consume the 
# events from the message queue and stream them to stdout.  This output stream can
# be consumed by linux scripting tools and converted to database records or some
# other relevant representation of the data.  
# For example: ./queuetostream ./sessioneventqueue > streamconsumer
# In the future a MySQL consumer may also be provided in order to update
# session accounting records in a MySQL database table.
SessionAccountingEnabled = false

# The following setting determines if repro will add routing header information
# (ie. Route, and Record-Route headers)to the Session Created, Session Routed
# and Session Established events.
SessionAccountingAddRoutingHeaders = false

# The following setting determines if we will add via header information to
# the Session Created event.  
SessionAccountingAddViaHeaders = false

# Registration Accounting - When enabled resiprocate will push a JSON formatted 
# events for every registration, re-registration, and unregistration message
# received to a persistent message queue that uses berkeleydb backed storage.
# The following registration events are logged:
#   Registration Added - initial registration received
#   Registration Refreshed - registration refresh received / re-register
#   Registration Removed - registration removed by client / unregister
#   Registration Removed All - all contacts registration remove / unregister
# Consuming Accounting Events:
# Users must ensure that this message queue is consumed, or it will grow without
# bound.  A queuetostream consumer process is provided, that will consume the 
# events from the message queue and stream them to stdout.  This output stream can
# be consumed by linux scripting tools and converted to database records or some
# other relevant representation of the data.  
# For example: ./queuetostream ./regeventqueue > streamconsumer
# In the future a MySQL consumer may also be provided in order to update 
# login/registration accounting records in a MySQL database table.
RegistrationAccountingEnabled = false

# The following setting determines if repro will add routing header information
# (ie. Route and Path headers)to registration accounting events.
RegistrationAccountingAddRoutingHeaders = false

# The following setting determines if we will add via header information to
# the registration accounting events.
RegistrationAccountingAddViaHeaders = false

# The following setting determines if we log the RegistrationRefreshed events
RegistrationAccountingLogRefreshes = false

# Run a Certificate Server - Allows PUBLISH and SUBSCRIBE for certificates
EnableCertServer = false

# Value of server and user agent headers for local UAS and registration
# server responses
#
# Default value is "repro PACKAGE_VERSION" if PACKAGE_VERSION is defined
# during compilation and no header is generated at all otherwise
#
#ServerText =

# Enables Congestion Management
CongestionManagement = true

# Congestion Management Metric - can take one of the following values:
# SIZE : Based solely on the number of messages in each fifo
# TIME_DEPTH : Based on the age of the oldest (front-most) message 
#              in each fifo.
# WAIT_TIME : Based on the expected wait time for each fifo; this is 
#             calculated by multiplying the size by the average service time. 
#             This is the recommended metric.
CongestionManagementMetric = WAIT_TIME

# Congestion Management Tolerance for the given metric.  This determines when the RejectionBehavior 
# changes.
# 0-80 percent of max tolerance -> NORMAL (Not rejecting any work.)
# 80-100 percent of max tolerance -> REJECTING_NEW_WORK (Refuses new work, 
#        not continuation of old work.)
# >100 percent of max tolerance -> REJECTING_NON_ESSENTIAL (Rejecting all work 
#      that is non-essential to the health of the system (ie, if dropping 
#      something is liable to cause a leak, instability, or state-bloat, don't drop it. 
#      Otherwise, reject it.)
# Units specified are dependent on Metric specified above:
#  If Metric is SIZE then units are number of messages
#  If Metric is TIME_DEPTH then units are the number seconds old the oldest message is
#  If Metric is WAIT_TIME then units are the expected wait time of each fifo in milliseconds
CongestionManagementTolerance = 200

# Specify the number of seconds between writes of the stack statistics block to the log files.
# Specifying 0 will disable the statistics collection entirely.  If disabled the statistics
# also cannot be retreived using the reprocmd interface.
StatisticsLogInterval = 3600

# Use MultipleThreads stack processing.
ThreadedStack = true

# The number of worker threads used to asynchronously retrieve user authentication information
# from the database store.
NumAuthGrabberWorkerThreads = 2

# The number of worker threads in Async Processor tread pool.  Used by all Async Processors
# (ie. RequestFilter)
NumAsyncProcessorWorkerThreads = 2

# Specify domains for which this proxy is authorative (in addition to those specified on web 
# interface) - comma separate list
# Notes: * Domains specified here cannot be used when creating users, domains used in user
#          AORs must be specified on the web interface.
#        * In previous versions of repro, localhost, 127.0.0.1, the machine's hostname,
#          and all interface addresses would automatically be appended to this
#          configuration parameter.  From now on, such values must be listed
#          here explicitly if required, e.g.
#
#             Domains = localhost, 127.0.0.1, sip-server.example.org, 10.83.73.80
#
#          although when using TLS only, it is not desirable or necessary to
#          add such values.
#
Domains =

# Uri to use as Record-Route
RecordRouteUri =

# Force record-routing
# WARNING: Before enabling this, ensure you have a RecordRouteUri setup, or are using
# the alternate transport specification mechanism and defining a RecordRouteUri per
# transport: TransportXRecordRouteUri
ForceRecordRouting = false

# Assume path option
AssumePath = true

# Disable registrar
DisableRegistrar = false

# Specify a comma separate list of enum suffixes to search for enum dns resolution
EnumSuffixes =

# Specify the target domain(s) for ENUM logic support.  When a dialed SIP URI
# is addressed to +number@somedomain,
# where somedomain is an element of EnumDomains,
# the ENUM logic will be applied for the number
# If empty, ENUM is never used
EnumDomains = 

# Specify length of timer C in sec (0 or negative will disable timer C) - default 180
TimerC = 180

# Override the default value of T1 in ms (you probably should not change this) - leave 
# as 0 to use default of 500ms)
TimerT1 = 0

# Disable outbound support (RFC5626)
# WARNING: Before enabling this, ensure you have a RecordRouteUri setup, or are using
# the alternate transport specification mechanism and defining a RecordRouteUri per
# transport: TransportXRecordRouteUri
DisableOutbound = false

# Set the draft version of outbound to support (default: RFC5626)
# Other accepted values are the versions of the IETF drafts, before RFC5626 was issued
# (ie. 5, 8, etc.)
OutboundVersion = 5626

# There are cases where the first hop in a particular network supports the concept of outbound
# and ensures all messaging for a client is delivered over the same connection used for
# registration.  This could be a SBC or other NAT traversal aid router that uses the Path 
# header.  However such endpoints may not be 100% compliant with outbound RFC and may not 
# include a ;ob parameter in the path header.  This parameter is required in order for repro
# to have knowledge that the first hop does support outbound, and it will reject registrations
# that appear to be using outboud (ie. instanceId and regId) with a 439 (First Hop Lacks Outbound
# Support).  In this case it can be desirable when using repro as the registrar to not reject
# REGISTRATION requests that contain an instanceId and regId with a 439.
# If this setting is enabled, then repro will assume the first hop supports outbound 
# and not return this error.
AssumeFirstHopSupportsOutbound = false

# Enable use of flow-tokens in non-outbound cases
# WARNING: Before enabling this, ensure you have a RecordRouteUri setup, or are using
# the alternate transport specification mechanism and defining a RecordRouteUri per
# transport: TransportXRecordRouteUri
EnableFlowTokens = true

# Enable use of flow-tokens in non-outbound cases for clients detected to be behind a NAT.  
# This a more selective flow token hack mode for clients not supporting RFC5626.  The 
# original flow token hack (EnableFlowTokens) will use flow tokens on all client requests.  
# Possible values are:  DISABLED, ENABLED and PRIVATE_TO_PUBLIC.
# WARNING: Before enabling this, ensure you have a RecordRouteUri setup, or are using
# the alternate transport specification mechanism and defining a RecordRouteUri per
# transport: TransportXRecordRouteUri
ClientNatDetectionMode = DISABLED

# Set to greater than 0 to enable addition of Flow-Timer header to REGISTER responses if 
# outbound is enabled (default: 0)
FlowTimer = 0


########################################################
# CertificateAuthenticator Monkey Settings
########################################################

# Enables certificate authenticator - note you MUST use a TlsTransport
# with TlsClientVerification set to Optional or Mandatory.
# There are two levels of checking:
# a) cert must be signed by a CA trusted by the stack
# b) the CN or one of the subjectAltName values must match the From:
#    header of each SIP message on the TlsConnection
# Examples:
# Cert 1:
#    common name = daniel@pocock.com.au
#    => From: <daniel@pocock.com.au> is the only value that will pass
# Cert 2:
#    subjectAltName = pocock.com.au
#    => From: <<anything>@pocock.com.au> will be accepted
# Typically, case 1 is for a real client connection (e.g. Jitsi), case 2
# (whole domain) is for federated SIP proxy-to-proxy communication (RFC 5922)
EnableCertificateAuthenticator = false

# A static text file that contains mappings of X.509 Common Names to
# permitted SIP `From:' addresses
#
# Without this file, the default behavior of the CertificateAuthenticator
# ensures that the `From:' address in SIP messages must match the 
# Common Name or one of the subjectAltNames from the X.509 certificate
#
# When this file is supplied, the CertificateAuthenticator will continue
# to allow SIP messages where there is an exact match between the
# certificate and the `From:' address, but it will also allow
# the holder of a particular certificate to use any of the `mapped'
# `From:' addresses specified in the mappings file
#
# Default: there is no default value: if this filename is not specified,
#          repro will not look for it
#
# File format:
# common name<TAB><mapping>,<mapping>,...
#
#    where:
#        <TAB> is exactly one tab
#        <mapping> is `user@domain' or just `domain'
#
#CommonNameMappings = /etc/repro/tlsUserMappings.txt


########################################################
# DigestAuthenticator Monkey Settings
########################################################

# Disable DIGEST challenges - disables this monkey
DisableAuth = false

# Always use a specified realm name to challenge
# Default behavior (if StaticRealm not specified) is to challenge
# using the hostname from the request URI as the realm
StaticRealm =

# Enable RADIUS lookups (only works if DIGEST enabled)
# Default: false
#EnableRADIUS = true

# Specify the configuration file the RADIUS client should use
# This is the file that specifies the name of the RADIUS server to
# use and other essential parameters.
# If different processes each have different RADIUS parameters,
# they can copy the radiusclient.conf file to a non-standard location
# and modify it as required.
#
# Note the following:
# - the seqfile specified in the RADIUS configuration file
#   must be writeable by the user the repro process runs as.
#   It is a good idea to locate that file in a directory such as /var/run/repro
#   owned by repro
# - the dictionary must include various elements such as Sip-Session,
#   copy these from the sample dictionary.sip file
# Default: /etc/radiusclient/radiusclient.conf
#RADIUSConfiguration = 

# Http hostname for this server (used in Identity headers)
HttpHostname =

# Disable adding identity headers
DisableIdentity = false

# Enable addition and processing of P-Asserted-Identity headers
EnablePAssertedIdentityProcessing = false

# Disable auth-int DIGEST challenges
DisableAuthInt = false

# Send 403 if a client sends a bad nonce in their credentials (will send a new 
# challenge otherwise)
RejectBadNonces = false

# allow To tag in registrations
AllowBadReg = false

########################################################
# Cookie Authentication Settings
########################################################

# Shared secret for cookie HMAC validation. If there is no WSCookieAuthSharedSecret
# there will be no cookie validation.
#
# See
#  http://www.resiprocate.org/SIP_Over_WebSocket_Cookies
# for details of the cookie authentication scheme
#
# WSCookieAuthSharedSecret =

# Names of the cookies to use for the cookie authentication protocol
# These are the default values:
#WSCookieNameInfo = WSSessionInfo
#WSCookieNameExtra = WSSessionExtra
#WSCookieNameMAC = WSSessionMAC

# Name of the extension header that must match the content of
# the authenticated WSSessionExtra cookie
#WSCookieExtraHeaderName = X-WS-Session-Extra

########################################################
# RequestFilter Monkey Settings
########################################################

# Disable RequestFilter monkey processing
DisableRequestFilterProcessor = false

# Default behavior for when no matching filter is found.  Leave empty to allow 
# request processing to continue.  Otherwise set to a SIP status error code
# (400-699) that should be used to reject the request (ie. 500, Server Internal
# Error).
# The status code can optionally be followed by a , and SIP reason text.
RequestFilterDefaultNoMatchBehavior =

# Default behavior for SQL Query db errors.  Leave empty to allow request processing
# to continue.  Otherwise set to a SIP status error code (400-699) that should be  
# used to reject the request (ie. 500 - Server Internal Error).
# The status code can optionally be followed by a , and SIP reason text.
# Note: DB support for this action requires MySQL support.
RequestFilterDefaultDBErrorBehavior = 500, Server Internal DB Error

# The hostname running MySQL server to connect to for any blocked entries
# that are configured to used a SQL statement.
# WARNING: repro must be compiled with the USE_MYSQL flag in order for this work.
#
# Note:  If this setting is left blank then repro will fallback all remaining my sql
# settings to use the global RuntimeMySQLServer or MySQLServer settings.  See the 
# documentation on the global MySQLServer settings for more details on the following 
# individual settings.
RequestFilterMySQLServer =
RequestFilterMySQLUser = root
RequestFilterMySQLPassword = root
RequestFilterMySQLDatabaseName = 
RequestFilterMySQLPort = 3306


########################################################
# StaticRoute Monkey Settings
########################################################

# Specify where to route requests that are in this proxy's domain - disables the 
# routes in the web interface and uses a SimpleStaticRoute monkey instead.
# A comma seperated list of routes can be specified here and each route will
# be added to the outbound Requests with the RequestUri left in tact.
Routes =

# Parallel fork to all matching static routes
ParallelForkStaticRoutes = false

# By default (false) we will stop looking for more Targets if we have found
# matching routes.  Setting this value to true will allow the LocationServer Monkey
# to run after StaticRoutes have been found.  In this case the matching
# StaticRoutes become fallback targets, processed only after all location server 
# targets fail.
ContinueProcessingAfterRoutesFound = false

# Challenge calls from third-party domains to local domains
# If certificate authentication is enabled and a
# request arrives over TLS, they will still not be
# challenged anyway if their domain certificate
# validates their message.
# Default: true if DIGEST challenge is enabled
ChallengeThirdPartiesCallingLocalDomains = true


########################################################
# Message Silo Monkey Settings
########################################################

# Specify where the Message Silo is enabled or not.  If enabled,
# then repro will store MESSAGE requests for users that are not online.
# When the user is back online (ie. registers with repro), the stored 
# messages will be delivered.
MessageSiloEnabled = false

# A regular expression that can be used to filter which URI's not to
# do message storage (siloing) for.  Destination/To URI's matching
# this regular expression will not be silo'd.
MessageSiloDestFilterRegex =

# A regular expression that can be used to filter which body/content/mime
# types not to do message storage (siloing) for.  Content-Type's matching
# this regular expression will not be silo'd.
MessageSiloMimeTypeFilterRegex = application\/im\-iscomposing\+xml

# The number of seconds a message request will be stored in the message silo.
# Messages older than this time, are candidates for deletion.  
# Default (259200 seconds = 30 days)
MessageSiloExpirationTime = 2592000

# Flag to indicate if a Date header should be added to replayed SIP 
# MESSAGEs from the silo, when a user registers.
MessageSiloAddDateHeader = true

# Defines the maximum message content length (bytes) that will be stored in
# the message silo.  Messages with a Content-Length larger than this 
# value will be discarded.
# WARNING:  Do not increasing this value beyond the capabilities of the
# database storage or internal buffers.
# Note: AbstractDb uses a read buffer size of 8192 - do not exceed this size.
MessageSiloMaxContentLength = 4096

# The status code returned to the sender when a messages is successfully
# silo'd.
MessageSiloSuccessStatusCode = 202

# The status code returned to the sender when a messages mime-type matches
# the MessageSiloMimeTypeFilterRegex.  Can be used to avoid sending errors
# to isComposing mime bodies that don't need to be silod.  Set to 0 to use
# repro standard response (ie. 480).
MessageSiloFilteredMimeTypeStatusCode = 200

# The status code returned to the sender when a messages is not silo'd due
# to the MaxContentLength being exceeded.
MessageSiloFailureStatusCode = 480


########################################################
# Recursive Redirect Lemur Settings
########################################################

# Handle 3xx responses in the proxy - enables the Recursive Redirect Lemur
RecursiveRedirect = false


########################################################
# Geo Proximity Target Sorter Baboon Settings
########################################################

# If enabled, then this baboon can post-process the target list.  
# This includes targets from the StaticRoute monkey and/or targets
# from the LocationServer monkey.  Requests that meet the filter 
# criteria will have their Target list, flatened (serialized) and
# ordered based on the proximity of the target to the client sending
# the request.  Proximity is determined by looking for a 
# x-repro-geolocation="<latitude>,<longitude>" parameter on the Contact
# header of a received request, or the Contact headers of Registration
# requests.  If this parameter is not found, then this processor will
# attempt to determine the public IP address closest to the client or
# target and use the MaxMind Geo IP library to lookup the geo location.
GeoProximityTargetSorting = false

# Specify the full path to the IPv4 Geo City database file
# Note:  A free version of the database can be downloaded from here:
# http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
# For a more accurate database, please see the details here:
# http://www.maxmind.com/app/city
GeoProximityIPv4CityDatabaseFile = GeoLiteCity.dat

# Specify the full path to the IPv6 Geo City database file
# Note:  A free version of the database can be downloaded from here:
# http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/
# For a more accurate database, please see the details here:
# http://www.maxmind.com/app/city
# Leave blank to disable V6 lookups.  Saves memory (if not required).
#GeoProximityIPv6CityDatabaseFile = GeoLiteCityv6.dat
GeoProximityIPv6CityDatabaseFile =

# This setting specifies a PCRE compliant regular expression to attempt
# to match against the request URI of inbound requests.  Any requests
# matching this expression, will have their targets sorted as described
# above.  Leave blank to match all requests.
GeoProximityRequestUriFilter = ^sip:mediaserver.*@mydomain.com$

# The distance (in Kilometers) to use for proximity sorting, when the 
# Geo Location of a target cannot be determined. 
GeoProximityDefaultDistance = 0

# If enabled, then targets that are determined to be of equal distance
# from the client, will be placed in a random order.
LoadBalanceEqualDistantTargets = true


########################################################
# Q-Value Target Handler Baboon Settings
########################################################

# Enable sequential q-value processing - enables the Baboon
QValue = true

# Specify forking behavior for q-value targets: FULL_SEQUENTIAL, EQUAL_Q_PARALLEL, 
# or FULL_PARALLEL
QValueBehavior = EQUAL_Q_PARALLEL

# Whether to cancel groups of parallel forks after the period specified by the 
# QValueMsBeforeCancel parameter.
QValueCancelBetweenForkGroups = true

# msec to wait before cancelling parallel fork groups when QValueCancelBetweenForkGroups
# is true
QValueMsBeforeCancel = 30000

# Whether to wait for parallel fork groups to terminate before starting new fork-groups.
QValueWaitForTerminateBetweenForkGroups = true

# msec to wait before starting new groups of parallel forks when 
# QValueWaitForTerminateBetweenForkGroups is false
QValueMsBetweenForkGroups = 3000


