default: sbin/wpanet

sbin/wpanet: sbin/wpanet.sh
	mv $< $@

sbin/wpanet.sh:
	cat tools/librc.sh etc/init.d/wpanet tools/endrc.sh | \
	grep -v '#!/sbin/runscript' > $@
	chmod +x $@

tarball: default
	tar cvf ../wpanet-$VERSION.tar README etc sbin tools
	gzip ../wpanet-$VERSION.tar
	
.PHONY: default tarball
