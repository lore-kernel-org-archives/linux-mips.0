Received: from localhost (localhost.lan [127.0.0.1])
	by mail.romat.com (Postfix) with ESMTP id 5579EEB2AB
	for <linux-mips@linux-mips.org>; Fri, 12 Nov 2004 12:37:45 +0200 (IST)
Received: from mail.romat.com ([127.0.0.1])
 by localhost (mail.romat.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 17773-07 for <linux-mips@linux-mips.org>;
 Fri, 12 Nov 2004 12:37:42 +0200 (IST)
Received: from gilad (unknown [192.168.1.167])
	by mail.romat.com (Postfix) with SMTP id 1A1B9EB2A9
	for <linux-mips@linux-mips.org>; Fri, 12 Nov 2004 12:37:42 +0200 (IST)
Message-ID: <095c01c4c8a3$bd9e0210$a701a8c0@lan>
From: "Gilad Rom" <gilad@romat.com>
Subject: GPIO on the Au1500
Date: Fri, 12 Nov 2004 12:38:25 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	format=flowed;
	charset="windows-1255";
	reply-type=original
Content-Transfer-Encoding: 7bit
Return-Path: <gilad@romat.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20041112103825.LiAoZKRpJNQkn9astZyIjMx_nhhmJwKbefXKhht84Do@z>

Hello,

I am trying to use the au1000_gpio driver, but I'm a little
clueless as to how it is meant to be used. Can I use the GPIO
ioctl's from a userland program, or must I write a kernel module?

Thank you,
Gilad Rom
Romat Telecom
