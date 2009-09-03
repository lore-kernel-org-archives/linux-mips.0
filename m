Received: from mail-px0-f180.google.com ([209.85.216.180]:41891 "EHLO
	mail-px0-f180.google.com" rhost-flags-OK-OK-OK-OK)
	by ftp.linux-mips.org with ESMTP id S1491870AbZICDtG (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Thu, 3 Sep 2009 05:49:06 +0200
Received: by pxi10 with SMTP id 10so1259434pxi.24
        for <linux-mips@linux-mips.org>; Wed, 02 Sep 2009 20:48:59 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 3 Sep 2009 11:48:59 +0800
Message-ID: <91b13c310909022048q467dff7cl90284b57132f4f14@mail.gmail.com>
Subject: How to debug glibc-2.10.1 mips on linux multilib o32 ld or libc
	Segmentation fault?
From: Cheng Renquan <crquan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Return-Path: <crquan@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: libc-help@sourceware.org, linux-mips@linux-mips.org, issues@eglibc.org
Message-ID: <20090903034859.sMfzpUHPDAlV7aFiJRco3K_i04hhlSDpN_j0Zn86TQQ@z>

Hello, all,
  Recently I have cross compiled GCC-4.4.1 with eglibc-2.10.1,
with a multilib configuration, o32/n32/n64, the result is that n32/n64
can work well, while o32 libs always Segmentation fault,

I have read this but still have no good idea on how to debug,

http://sources.redhat.com/glibc/wiki/Debugging/Development_Debugging

then I run it like this,

$ LD_DEBUG=all eglibc-install-root-o32/lib/ld.so.1 --library-path
$PWD/eglibc-install-root-o32/lib
eglibc-install-root-o32/usr/bin/locale

it ends with:

     30257:	symbol=__stack_chk_guard;  lookup in
file=eglibc-install-root-o32/usr/bin/locale [0]
     30257:	symbol=__stack_chk_guard;  lookup in
file=/mnt/nas/yutech/homes/user/eglibc-install-root-o32/lib/libc.so.6
[0]
     30257:	symbol=__stack_chk_guard;  lookup in
file=eglibc-install-root-o32/lib/ld.so.1 [0]
     30257:	binding file eglibc-install-root-o32/lib/ld.so.1 [0] to
eglibc-install-root-o32/lib/ld.so.1 [0]: normal symbol
`__stack_chk_guard' [GLIBC_2.4]
     30257:	
     30257:	calling init:
/mnt/nas/yutech/homes/user/eglibc-install-root-o32/lib/libc.so.6
     30257:	
Segmentation fault

So please give some inputs on how to resolve this? Thanks,

-- 
Cheng Renquan
