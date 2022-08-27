{ system "l lib/", .Q.s2 x } each { x where (x like "*.q") and not x = `statq.q } key `$":lib";
show `$"Loading statq... Done";
show `$"All functions are defined under .statq namespace";
