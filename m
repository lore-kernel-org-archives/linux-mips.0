Received: from localhost (localhost.tusur.ru [127.0.0.1])
	by tusur.ru (Postfix) with SMTP id 3CE8EB6789
	for <linux-mips@linux-mips.org>; Wed, 21 Jul 2004 12:14:08 +0700 (TSD)
Received: from roman (unknown [211.189.32.204])
	by tusur.ru (Postfix) with ESMTP id 07A83B5212
	for <linux-mips@linux-mips.org>; Wed, 21 Jul 2004 12:13:53 +0700 (TSD)
Message-ID: <002701c46ee1$feeb7fc0$cc20bdd3@roman>
From: "Roman Mashak" <mrv@tusur.ru>
Subject: simple assembler program
Date: Wed, 21 Jul 2004 14:17:14 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: 7bit
Return-Path: <mrv@tusur.ru>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20040721051714.uIZTH4gr8b2KiMoT0wKfl1q1oq5Yz82qetv1pvTniBc@z>

Hello!

    I tried to compile simple assembler program:

#define a 1
#define b 2

.ent main
.global main
main:
        li $3, a
        li $2, b
        addu $4, $2, $3
.end main

I use SDE-lite kit version 5.03.06 and compile with sde-as:
#sde-as test.S -o testtest.S: Assembler messages:
test.S:9: Error: absolute expression required `li'
test.S:10: Error: absolute expression required `li'

When I eliminate #define and use just 'li $3, 1' and so on - everything is
compiled correctly. Where is my problem?

Thanks in advance!

With best regards, Roman Mashak.  E-mail: mrv@tusur.ru
