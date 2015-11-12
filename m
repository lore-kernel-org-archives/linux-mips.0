Received: from mailapp01.imgtec.com ([195.59.15.196]:48336 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013422AbbKLTujJSZxC convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 12 Nov 2015 20:50:39 +0100
From: Nikola Veljkovic <Nikola.Veljkovic@imgtec.com>
Subject: RE: [PATCH] MIPS: personality syscall discrepancy on mips64-o32/n32
Date: Thu, 12 Nov 2015 19:50:26 +0000
Message-ID: <19CDB9880DBFC241860D925D8FAA94A024A0AFBA@BADAG02.ba.imgtec.org>
References: <19CDB9880DBFC241860D925D8FAA94A00342EAB8@BADAG02.ba.imgtec.org>
 <20150818125605.GA25978@mchandras-linux.le.imgtec.org>
 <19CDB9880DBFC241860D925D8FAA94A00342F48A@BADAG02.ba.imgtec.org>,<20151112162529.GF29184@linux-mips.org>
In-Reply-To: <20151112162529.GF29184@linux-mips.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <Nikola.Veljkovic@imgtec.com>
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
Cc: Markos Chandras <Markos.Chandras@imgtec.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Chris Dearman <Chris.Dearman@imgtec.com>, Raghu Gandham <Raghu.Gandham@imgtec.com>, Miodrag Dinic <Miodrag.Dinic@imgtec.com>, Petar Jovanovic <Petar.Jovanovic@imgtec.com>, Lazar Trsic <Lazar.Trsic@imgtec.com>
Message-ID: <20151112195026.AmFdBMo2__Hc8N75LuEcSK1CVfpThSNsZsAWqPRBuOs@z>

>For anything that changes an established ABI - in this case for about 15 or
>16 years I'm going to be conservative at changing such an ABI.  Also Sparc64
>and PowerPC are using the exactly same wrapper.

>Anyway, can you tell me more about the Android issue?

I started the discussion after Google updated personality test in bionic [1].
Test expects the PER_LINUX32 to be returned for a 32-bit binary, so it fails
on mips64 for 32bit binaries.
https://android-review.googlesource.com/#/c/157455/1/tests/sys_personality_test.cpp

My guess was that the changes in test were going to be followed with the code
dependent on the personality syscall elsewhere, but so far that did not happen.
Only user of the personality syscall in Android is strace, and there are no 
issues with it as far as I know.

Also, my understanding of the risks the change in kernel would create was wrong.
