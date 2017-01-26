Received: from mail-by2nam01on0087.outbound.protection.outlook.com ([104.47.34.87]:32736
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23992227AbdAZGKxm0bmE (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 26 Jan 2017 07:10:53 +0100
Date: Thu, 26 Jan 2017 07:10:30 +0100
From: Jan Glauber <jan.glauber@caviumnetworks.com>
Subject: Re: [PATCH 4/4] i2c: octeon: thunderx: Add I2C_CLASS_HWMON
Message-ID: <20170126061030.GA2827@hardcore>
References: <20161209093158.3161-1-jglauber@cavium.com>
 <20161209093158.3161-5-jglauber@cavium.com>
 <20161211220434.GH2552@katana>
 <20170125204923.2mxtlszvco6wxjok@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20170125204923.2mxtlszvco6wxjok@ninjato>
Return-Path: <Jan.Glauber@cavium.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa-dev@sang-engineering.com>, Paul Burton <paul.burton@imgtec.com>, "Steven J . Hill" <Steven.Hill@cavium.com>, linux-i2c@vger.kernel.org, linux-mips@linux-mips.org, David Daney <david.daney@cavium.com>
Message-ID: <20170126061030.O9MZ8j25nhAy6R4icAbXiLNeVDSZMte-RcinP8BLopA@z>

On Wed, Jan 25, 2017 at 09:49:23PM +0100, Wolfram Sang wrote:
> On Sun, Dec 11, 2016 at 11:04:35PM +0100, Wolfram Sang wrote:
> > On Fri, Dec 09, 2016 at 10:31:58AM +0100, Jan Glauber wrote:
> > > It was reported that ipmi_ssif fails to create the
> > > ipmi device on some systems if the adapter class is not containing
> > > I2C_CLASS_HWMON. Fix it by setting the class.
> > > 
> > > Reported-by: Vadim Lomovtsev <Vadim.Lomovtsev@caviumnetworks.com>
> > > Signed-off-by: Jan Glauber <jglauber@cavium.com>
> > 
> > The intention of adapter classes is to *limit* probing to a certain
> > class of devices. If a class is needed to *enable* probing, then
> > something there looks wrong. From the details given, this must be solved
> > elsewhere I'd say.
> 
> Makes sense?
> 

Yes, perfectly, the patch can be dropped.

thanks,
Jan
