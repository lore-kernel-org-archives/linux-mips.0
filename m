Received: from mailapp01.imgtec.com ([195.59.15.196]:50316 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010674AbbKMAqlYcTJl (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 13 Nov 2015 01:46:41 +0100
Date: Fri, 13 Nov 2015 00:46:33 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH 0/(8+2)] MIPS: IEEE Std 754-2008 features
Message-ID: <alpine.DEB.2.00.1511111418430.7097@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Fortune <Matthew.Fortune@imgtec.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20151113004633.yeFEpdM7_Rkv1njgikYyMC5MckdfzCDgQimvOoXjuZA@z>

Hi,

 As many of you have been aware it has been a long practice for software
using IEEE 754 floating-point arithmetic run on MIPS processors to use an
encoding of Not-a-Number (NaN) data different to one used by software run
on other processors.  And as of IEEE 754-2008 revision [1] this encoding
does not follow one recommended in the standard, as specified in section
6.2.1, where it is stated that quiet NaNs should have the first bit (d1)
of their significand set to 1 while signalling NaNs should have that bit
set to 0, but MIPS software interprets the two bits in the opposite
manner.

 As from revision 3.50 [2][3] the MIPS Architecture provides for 
processors that support the IEEE 754-2008 preferred NaN encoding format. 
As the two formats (further referred to as "legacy NaN" and "2008 NaN") 
are incompatible to each other, the run-time environment has to provide 
support for the two formats to help people avoid using incompatible binary 
modules.  Here is the Linux kernel part.

 These are 8 changes comprising the actual feature and a set of 2 extra 
patches -- a code structure clean-up for ELF personality macros, and a 
proposal to make sNaN bit pattern propagation more in line with the 
current version of the said standard even for legacy-NaN implementations.

 The complementing glibc dynamic loader part has been posted here: 
<http://sourceware.org/ml/libc-ports/2013-09/msg00048.html> and included 
in FSF glibc <git://sourceware.org/git/glibc.git> with commit 9c21573c.

 References:

[1] "IEEE Standard for Floating-Point Arithmetic", IEEE Computer Society,
    IEEE Std 754-2008, 29 August 2008

[2] "MIPS Architecture For Programmers, Volume I-A: Introduction to the
    MIPS32 Architecture", MIPS Technologies, Inc., Document Number:
    MD00082, Revision 3.50, September 20, 2012

[3] "MIPS Architecture For Programmers, Volume I-A: Introduction to the
    MIPS64 Architecture", MIPS Technologies, Inc., Document Number:
    MD00083, Revision 3.50, September 20, 2012

  Maciej
