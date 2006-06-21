Received: from dsl-KK-static-026.199.95.61.touchtelindia.net ([61.95.199.26]:17118
	"EHLO mailsvr.procsys.com") by ftp.linux-mips.org with ESMTP
	id S8133364AbWFUFgc (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Wed, 21 Jun 2006 06:36:32 +0100
Message-ID: <110701c694f4$f1412fb0$f301a8c0@procsys>
From: "ankur maheshwari" <ankur_maheshwari@procsys.com>
References: <20060615225723.012c82be.khali@linux-fr.org><1150406598.1193.73.camel@localhost.localdomain><20060616222908.f96e3691.khali@linux-fr.org><1150735558.8413.7.camel@localhost.localdomain> <20060620120836.628ddc79.khali@linux-fr.org>
Subject: Re: i2c-algo-ite and i2c-ite planned for removal
Date: Wed, 21 Jun 2006 11:08:34 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <ankur_maheshwari@procsys.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Jean Delvare <khali@linux-fr.org>, Pete Popov <ppopov@embeddedalley.com>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20060621053834.lw9hlJDS5FBu_gvN7u1kQTDAHRLzJ7xyKMBFdoVNquM@z>

hi all,

I have used once i2c-adap-ite and i2c-algo-ite for ite-8712 chip and it
worked fine for me in MV 2.4.25. Its been an year ago, I asked on same forum
if some one has used it before but I didn't got any reply.

I added this struct definition in a .h (i2c-adap-ite.h) file which we need
to include in i2c-adap-ite.c also program ite-8712 controller pins for i2c
use.

struct iic_ite {
	int iic_base;
	int iic_irq;
	int iic_clock;
	int iic_own;
};

It worked perfectly fine for me.

It's just an info on ite-chip works, to remove it from kernel tree .....
decision is up to you : ).

thanks,
Ankur

----- Original Message -----
From: "Jean Delvare" <khali@linux-fr.org>
To: "Pete Popov" <ppopov@embeddedalley.com>
Cc: <linux-mips@linux-mips.org>; <linux-kernel@vger.kernel.org>
Sent: Tuesday, June 20, 2006 3:38 PM
Subject: Re: i2c-algo-ite and i2c-ite planned for removal


> Hi Pete,
>
> > > > For historical correctness, this driver was once upon a time usable,
> > > > though it was a few years ago. It was written by MV for some ref
board
> > > > that had the ITE chip and it did work. That ref board is no longer
> > > > around so it's probably safe to nuke the driver.
> > >
> > > In which kernel version? In every version I checked (2.4.12, 2.4.30,
> > > 2.6.0 and 2.6.16) it wouldn't compile due to struct iic_ite being used
> > > but never defined (and possibly other errors, but I can't test-compile
> > > the driver.)
> >
> > Honestly, I don't remember. I think it was one of the very first 2.6
> > kernels because when MV first released a 2.6 product, 2.6 was still
> > 'experimental'. It's quite possible of course that the driver was never
> > properly merged upstream in the community tree(s). But I do know that it
> > worked in the internal MV tree and an effort was made to get the driver
> > accepted upstream.
>
> I couldn't find any evidence of this effort. Whatever, past is past, if
> someone fixes the i2c-ite and i2c-algo-ite drivers soon, fine with me,
> if not, the drivers will be deleted (which doesn't mean they can't be
> resurrected later if there is interest and someone takes over
> maintenance.) I'm setting the deadline to September 2006.
>
> --
> Jean Delvare
