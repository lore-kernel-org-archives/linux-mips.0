Received: from fw-ca-1-hme0.vitesse.com ([64.215.88.90]:2019 "EHLO
	email.vitesse.com") by ftp.linux-mips.org with ESMTP
	id S8133791AbWCMUIT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Mon, 13 Mar 2006 20:08:19 +0000
Received: from wilson.vitesse.com (wilson [10.9.72.71])
	by email.vitesse.com (8.11.0/8.11.0) with ESMTP id k2DKHD308128
	for <linux-mips@linux-mips.org>; Mon, 13 Mar 2006 12:17:13 -0800 (PST)
Received: from MX-COS.vsc.vitesse.com (mx-cs1 [10.9.72.41])
	by wilson.vitesse.com (8.11.6/8.11.6) with ESMTP id k2DKHZb20441
	for <linux-mips@linux-mips.org>; Mon, 13 Mar 2006 13:17:38 -0700 (MST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: Cross compile kernel w/ buildroot toolchain
Date: Mon, 13 Mar 2006 13:17:09 -0700
Message-ID: <389E6A416914954182ECDFCD844D8269434FBE@MX-COS.vsc.vitesse.com>
From: "Kurt Schwemmer" <kurts@vitesse.com>
Return-Path: <kurts@vitesse.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20060313201709.jwk4Hl5VV2lmcOnBlgMe2C67pcqBqobUTzDu40UbC04@z>

I'm trying to figure out a toolchain to use for my system. I can compile
the kernel just fine using the MIPS SDE based distribution, but you
can't cross compile apps with that. I downloaded and built buildroot and
I'm trying to (cross) compile the kernel with it too (I'd like to just
use one compiler for everything). I had it use gcc 3.4.5. When I try to
compile the kernel with:

make
CROSS_COMPILE=~/buildroot/build_mipsel/staging_dir/bin/mipsel-linux-

I eventually get an error while assembling entry.o:
  AS      arch/mips/kernel/entry.o
arch/mips/kernel/entry.S: Assembler messages:
arch/mips/kernel/entry.S:157: Error: opcode not supported on this
processor: mips32 (mips32) `jr.hb $31'
make[1]: *** [arch/mips/kernel/entry.o] Error 1
make: *** [arch/mips/kernel] Error 2

I guess this is a "hazard barrier" instruction. Why doesn't gcc 3.4.5
know about it? What do I need to do to get this to work?

Thanks,
Kurt Schwemmer
