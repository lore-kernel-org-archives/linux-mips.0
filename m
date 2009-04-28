Received: from mail-gx0-f157.google.com ([209.85.217.157]:34519 "EHLO
	mail-gx0-f157.google.com" rhost-flags-OK-OK-OK-OK)
	by ftp.linux-mips.org with ESMTP id S20025285AbZD1Io4 (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Tue, 28 Apr 2009 09:44:56 +0100
Received: by gxk1 with SMTP id 1so884829gxk.0
        for <linux-mips@linux-mips.org>; Tue, 28 Apr 2009 01:44:49 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 28 Apr 2009 16:44:49 +0800
Message-ID: <777f39b10904280144n40637597tf5d7da2a6c337d11@mail.gmail.com>
Subject: [mips simulator help] I want to use simulator to run 2.4.21 kernel
	(mips ->malta board) .
From: Bob Zhang <2004.zhang@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-Path: <2004.zhang@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Cc: "bob.zhang2004" <bob.zhang2004@gmail.com>, "Christophe.Carvounas" <christophe.carvounas@gmail.com>, Bob Zhang <2004.zhang@gmail.com>
Message-ID: <20090428084449.-Z5BY_Tq2QB_WPlkyLVC3U2zDDL5owc9S0LiLAerwkQ@z>

1,
now , I know " gxemul " should act as this task .

but , from gxemul website , I can't get detailed information,
for example, for simulator , how to compile our linux kernel source
code, they only provide their vmlinux binary, but this is useless for
developers.  we don't want a existed vmlinux,  we need to recompile
linux kernel code to run and we can modify our own kernel source code
to develop linux kernel.


Could you tell me how to build up a environment to use gxeuml to run
2.4.21 or 2.4.x (mips ->malta board) , any comment is welcome.
thanks very much!

I have experience to play , skyeye , but skyeye seems that doesn't
support MIPS yet(from the news from their offical website) .

except for skyeye and gxemul , what simulators can run 2.4.x mips kernel ?

2, which mipsel toolchain can be suitable for compiling 2.4.21 mips
malta board code ?
thanks for the url , thanks very much!
