Received: from sonic313-11.consmr.mail.ne1.yahoo.com ([66.163.185.34]:43510
        "EHLO sonic313-11.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994061AbeHBVwjTOPrq (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 2 Aug 2018 23:52:39 +0200
Date: Thu, 2 Aug 2018 21:52:31 +0000 (UTC)
From: "A.W.C." <bluestream@ymail.com>
Reply-To: "A.W.C." <bluestream@ymail.com>
Message-ID: <628114933.1303330.1533246751884@mail.yahoo.com>
Subject: disassembling raw MIPS binary
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <628114933.1303330.1533246751884.ref@mail.yahoo.com>
Return-Path: <bluestream@ymail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Message-ID: <20180802215231.G9PqxRbdkCnGeFYAxqn2rESd3tjCsMjcyRH-CJsey6Y@z>

Hello,

I tried disassemble raw MIPS binary with opcodes on Linux machine. I run command

$ mips-linux-gnu-objdump -D -b bootloader.bin
mips-linux-gnu-objdump: 'a.out': No such file

how to solve this?

Regards,
