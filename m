Received: from fairytale.tal.org (cruel.tal.org [195.16.220.85])
	by gw01.mail.saunalahti.fi (Postfix) with ESMTP id 67B7036364
	for <linux-mips@linux-mips.org>; Wed,  7 Jul 2004 17:36:35 +0300 (EEST)
Received: from amos (unknown [195.16.220.84])
	by fairytale.tal.org (Postfix) with SMTP id 0CF4F8D77
	for <linux-mips@linux-mips.org>; Wed,  7 Jul 2004 17:38:14 +0300 (EEST)
Message-ID: <00e201c46430$5cc18250$54dc10c3@amos>
From: "Kaj-Michael Lang" <milang@tal.org>
References: <000d01c463d1$994e59a0$6030a8c0@eng32>
Subject: Re: querries on cross compiler
Date: Wed, 7 Jul 2004 17:40:32 +0300
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <milang@tal.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20040707144032.IhfZI9t96EDS8tzOXRzRO6Z-qV9ZwJD8AhF6SUNSEE4@z>

> Iam trying to build a cross compiler for MIPS processor on
> "i686-pc-linux-gcc" host. Iam getting some errors during the installation
of
> BINUTILS(binutils-2.9.1) i.e, after configure, when I type "make" Iam
> getting errors. Can u please suggest how to remove these errors.

That binutils is extremly old, try using something a little more uptodate...
I'd recommend using crosstool to build you cross compiler.

-- 
Kaj-Michael Lang , milang@tal.org
