From: "Robert Rusek" <robru@teknuts.com>
Subject: depmod help !
Date: Mon, 6 May 2002 21:09:11 -0700
Message-ID: <001501c1f57c$f2188e90$6601a8c0@delllaptop>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20020507040911.TJ5sM8TbFwuFhSK0RamfLJYGXv-CgU7umB-F0z-GaZ8@z>

I am running his on an Indy. I have kernel 2.4.17 and modutils 2.4.16.
When a depmod is performed I get the following message:

depmod: cannot read ELF header from /lib/modules/2.4.17/modules.dep
depmod: cannot read ELF header from
/lib/modules/2.4.17/modules.generic_string
depmod: /lib/modules/2.4.17/modules.ieee1394map is not an ELF file
depmod: /lib/modules/2.4.17/modules.isapnpmap is not an ELF file
depmod: cannot read ELF header from
/lib/modules/2.4.17/modules.parportmap
depmod: /lib/modules/2.4.17/modules.pcimap is not an ELF file
depmod: cannot read ELF header from
/lib/modules/2.4.17/modules.pnpbiosmap
depmod: /lib/modules/2.4.17/modules.usbmap is not an ELF file

How can I correct this?  I am trying to clean up my startup before I
start using the machine.

Thank you in advance.
--
Robert Rusek
