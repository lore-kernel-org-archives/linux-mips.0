Received: from toch.dfpost.ru (toch.dfpost.ru [192.168.7.60])
	by mail.dfpost.ru (Postfix) with SMTP id 21ECF3E517
	for <linux-mips@linux-mips.org>; Tue,  7 Dec 2004 18:37:05 +0300 (MSK)
Date: Tue, 7 Dec 2004 18:42:58 +0300
From: Dmitriy Tochansky <toch@dfpost.ru>
Subject: mmap problem
Message-ID: <20041207184258.071bf401.toch@dfpost.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-Path: <toch@dfpost.ru>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20041207154258.W7z5dPvdbnCZvbChyFINpvX-9DRpZCCNp3CGarSqNTc@z>

Hi!
I try to write small driver to make access to pci device resource from 
userland using mmap.
Code below didnt work. :(
