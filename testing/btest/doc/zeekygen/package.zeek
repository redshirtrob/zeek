# @TEST-PORT: BROKER_PORT
# @TEST-EXEC: unset BRO_DISABLE_BROXYGEN; zeek -b -X zeekygen.config %INPUT Broker::default_port=$BROKER_PORT
# @TEST-EXEC: btest-diff test.rst

@TEST-START-FILE zeekygen.config
package	zeekygen	test.rst
@TEST-END-FILE

@load zeekygen
