Received: from RADIUM ([192.168.1.19])
	by Radium.intranet (8.9.3/8.9.3) with ESMTP id RAA29708
	for <linux-mips@linux-mips.org>; Tue, 22 Apr 2003 17:34:22 -0500
From: "Lyle Bainbridge" <lyle@zevion.com>
Subject: ide_ops issues for big endian mips
Date: Tue, 22 Apr 2003 17:45:29 -0500
Message-ID: <000801c30920$df9a4a20$1301a8c0@RADIUM>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-Path: <lyle@zevion.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20030422224529.jWTI9v67fosA56bifAvR90lFyffxA_O8eAiwgyj803k@z>


I am using an Au1500 based system in big endian mode.
IDE worked fine with the 2.4.20 kernel, but broke in
the 2.4.21 kernel.  It seems that the 2.4.20 IDE code
provided some IDE operations ide_insw, ide_outsw,
ide_insl and ide_outsl, that didn't use the standard
io.h functions (insw, outsw, insl, outsl) but instead 
provided some special IDE versions that didn't do the
byte swapping done by the standard calls.

This is not true for the 2.4.21 IDE code.  It uses the
standard functions in io.h and these do the byte swapping
and things don't work.  By changing these functions to
not swap, IDE works for me again.

Any thoughts? Anybody else seen this?   Am I doing something
wrong and fixing a symptom not the problem?

Lyle
