Date: Fri, 20 Jul 2001 16:15:28 -0600
Subject: SHN_MIPS_SCOMMON
From: Greg Satz <satz@ayrnetworks.com>
Message-ID: <B77E099F.87B7%satz@ayrnetworks.com>
Mime-version: 1.0
Content-type: text/plain; charset="US-ASCII"
Content-transfer-encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20010720221528._skSd6Xi7RTtSQg6YIGiD84R6tF9jwOXXYW3z70qEaU@z>

When making modules for the 2.4.2 kernel, gcc and friends will generate
SHN_MIPS_SCOMMON ELF segments (0xff03). Unfortunately insmod (obj_reloc.c)
doesn't know how to relocate these symbols and the module page faults at
location 4 upon initialization.

Is this a bug in obj_reloc.c not handling SHN_MIPS_SCOMMON like SHN_COMMON
or should everyone who makes mips kernel modules be using the -fno-common
gcc flag?

Thanks,
Greg
