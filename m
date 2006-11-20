Received: from fnoeppeil48.netpark.at ([217.175.205.176]:44047 "EHLO
	roarinelk.homelinux.net") by ftp.linux-mips.org with ESMTP
	id S20038189AbWKTMBu (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Mon, 20 Nov 2006 12:01:50 +0000
Date: Mon, 20 Nov 2006 13:01:48 +0100
From: Manuel Lauss <mano@roarinelk.homelinux.net>
Subject: Re: au1xmmc.c: does it work?
Message-ID: <20061120120148.GA13740@roarinelk.homelinux.net>
References: <20061120094053.GA13509@roarinelk.homelinux.net> <20061120104922.GC32045@dusktilldawn.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20061120104922.GC32045@dusktilldawn.nl>
Return-Path: <mano@roarinelk.homelinux.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Freddy Spierenburg <freddy@dusktilldawn.nl>
Cc: linux-mips@linux-mips.org
Message-ID: <20061120120148.K42oVjleto8qD7ENt8UOvtU2158jYDF8Oz1xQaMybJo@z>

Hi Freddy,

On Mon, Nov 20, 2006 at 11:49:22AM +0100, Freddy Spierenburg wrote:
> On Mon, Nov 20, 2006 at 10:40:53AM +0100, Manuel Lauss wrote:
> > I insert a known working card, and the mmc cmd trace suggests
> > CMD9 (send CSD) times out.
> 
> Are you working with a real MMC card or with an SD-card?

SD cards so far. MMC seems broken in a different way.

> I myself am not able to get several SD-cards working, even though
> SD-cards should be able to talk the MMC-protocol (AFAIK).
