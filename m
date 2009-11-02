Received: from mail-bw0-f221.google.com ([209.85.218.221]:52643 "EHLO
	mail-bw0-f221.google.com" rhost-flags-OK-OK-OK-OK)
	by ftp.linux-mips.org with ESMTP id S1493838AbZKBLn0 (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Mon, 2 Nov 2009 12:43:26 +0100
MIME-Version: 1.0
In-Reply-To: <20091102112955.GA2821@linux-mips.org>
References: <200910181604.11732.florian@openwrt.org>
	 <f861ec6f0910190412i3910246dgcdf6b8b56a8ed5b3@mail.gmail.com>
	 <20091102112955.GA2821@linux-mips.org>
Date: Mon, 2 Nov 2009 12:43:20 +0100
Message-ID: <f861ec6f0911020343v69c8d82q16ad1af7691471af@mail.gmail.com>
Subject: Re: [PATCH 1/2] alchemy: fix warnings in db1x00/pb1000/pb1550 board
	setup code
From: Manuel Lauss <manuel.lauss@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-1
Return-Path: <manuel.lauss@googlemail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Florian Fainelli <florian@openwrt.org>, linux-mips@linux-mips.org
Message-ID: <20091102114320.oO8W0J1mQGxtBTAm3lf9Yz-pmxr5l93pLSqPBKxSAeY@z>

On Mon, Nov 2, 2009 at 12:29 PM, Ralf Baechle <ralf@linux-mips.org> wrote:
> On Mon, Oct 19, 2009 at 01:12:15PM +0200, Manuel Lauss wrote:
>
>> I like it, thank you!
>
> Except that it a) does things the comments don't mention and b) doesn't

It does eliminate all the "variable may be unused"-type warnings...


> apply on top of master or -queue ...

It did apply against -queue when Floarian initally sent it.  If he doesn't
resurface in the next few days I'll send an update version.

Manuel
