content-class: urn:content-classes:message
Subject: RE: swapon failure with au1550
Date: Tue, 22 Feb 2005 16:20:28 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Message-ID: <B482D8AA59BF244F99AFE7520D74BF9609D4F2@server1.RightHand.righthandtech.com>
From: "Bob Breuer" <bbreuer@righthandtech.com>
Return-Path: <bbreuer@righthandtech.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20050222222028.35IN27ZJ1Wqa12UfYv6RevujqiT40D3UPIhfdeTydUA@z>

The bitmask in a pte for swap type is 0x0000_1f00.  In the CPU_MIPS32 &&
64BIT_PHYS_ADDR case, _PAGE_FILE is 0x0000_0400.  Since _PAGE_FILE is
set in the maxed out swap type, it triggers a BUG().

If I move the swap type field like this:
  #define __swp_type(x)  (((x).val >> 2) & 0x0f)
then it works for me.  This makes use of the _PAGE_DIRTY and _CACHE_MASK
bits which were being used in the !64BIT_PHYS_ADDR case.

Is this a reasonable solution, or should a different grouping of bits be
used?

Bob Breuer
