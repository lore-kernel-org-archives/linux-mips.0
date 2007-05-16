Received: from smtp-103-wednesday.noc.nerim.net ([62.4.17.103]:57359 "EHLO
	mallaury.nerim.net") by ftp.linux-mips.org with ESMTP
	id S20023300AbXEPSU2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Wed, 16 May 2007 19:20:28 +0100
Date: Wed, 16 May 2007 20:20:01 +0200
From: Jean Delvare <khali@linux-fr.org>
Subject: Re: [PATCH 1/2] i2c-au1550: send i2c stop on error #2
Message-ID: <20070516202001.7a7b2451@hyperion.delvare>
In-Reply-To: <20070516142038.GA15418@roarinelk.homelinux.net>
References: <20070516053113.GA12986@roarinelk.homelinux.net>
	<20070516153822.176cbd68@hyperion.delvare>
	<20070516142038.GA15418@roarinelk.homelinux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-Path: <khali@linux-fr.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Manuel Lauss <mano@roarinelk.homelinux.net>
Cc: i2c@lm-sensors.org, linux-mips@linux-mips.org, Domen Puncer <domen.puncer@ultra.si>
Message-ID: <20070516182001.PW6fK5VA0kMX1TbVNUkTcrj6yw4-XOlY3GsRd38alUU@z>

On Wed, 16 May 2007 16:20:38 +0200, Manuel Lauss wrote:
> > 2* In i2c_write and i2c_read, the stop bit is always sent together with
> > the last byte, while your new code sends the stop bit on its own after
> > the address byte. Is it OK? 
> 
> Well, no. However the quick probe does an i2c read IIRC so it should be
> safe. I'll fix that too.
