# @TEST-EXEC: bro -b %INPUT >out
# @TEST-EXEC: btest-diff out


event e1()
	{
	print "event statement";
	return;
	print "Error: this should not happen";
	}

event e2()
	{
	print "schedule statement";
	}

event e3(test: string)
	{
	print "event part1";
	}

event e4(num: count)
	{
	print "assign event variable";
	}

# Note: the name of this event is intentionally the same as one above
event e3(test: string)
	{
	print "event part2";
	}

event bro_init()
{
	# Test calling an event with "event" statement
	event e1();

	# Test calling an event with "schedule" statement
	schedule 1 sec { e2() };

	# Test calling an event that has two separate definitions
	event e3("foo");

	# Test assigning an event variable to an event
	local e5: event(num: count);
	e5 = e4;
	event e5(6);  # TODO: this does not do anything
}

