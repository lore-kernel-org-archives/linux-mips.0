Received: from smtp3.infineon.com ([203.126.106.229]:44036 "EHLO
	smtp3.infineon.com") by ftp.linux-mips.org with ESMTP
	id S20029240AbYAEL34 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Sat, 5 Jan 2008 11:29:56 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: Arch/mips/kernel/vpe.c
Date: Sat, 5 Jan 2008 19:29:46 +0800
Message-ID: <31E09F73562D7A4D82119D7F6C1729860320EADA@sinse303.ap.infineon.com>
From: <KokHow.Teh@infineon.com>
Return-Path: <KokHow.Teh@infineon.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20080105112946.Og0zzjsbhAHTCjN9LGN_ay-xZgKLY3Du4BEhfpEgltc@z>

Hi;
	I am working on MIPS34KC with APRP kernel and I use uclibc
gccc-3.4.4 to build applications to run on VPE1. The present
implementation of VPE loader is limited to a few relocation types which
are used when mips_sde compiler is used. However, the relocatable binary
churn out from my uclibc-gcc-3.4.4 has more other relocation types than
the ones defined in arch/mips/kernel/vpe.c, especially those with GOT
relocation types. I have taken a look at the System V ABI Third Edition
but if anybody has any code reference and pointers to how each
relocation types should be implemented in C-code, it would be very
helpful.
	Thanks.

Regards,
KH
