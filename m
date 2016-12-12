Received: from mail-by2nam03on0084.outbound.protection.outlook.com ([104.47.42.84]:42571
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993005AbcLLQHc5K-4u (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 12 Dec 2016 17:07:32 +0100
Date: Mon, 12 Dec 2016 17:07:11 +0100
From: Jan Glauber <jan.glauber@caviumnetworks.com>
Subject: Re: [PATCH 3/4] i2c: octeon: thunderx: Limit register access retries
Message-ID: <20161212160711.GA2766@hardcore>
References: <20161209093158.3161-1-jglauber@cavium.com>
 <20161209093158.3161-4-jglauber@cavium.com>
 <20161211220148.GG2552@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20161211220148.GG2552@katana>
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
Message-ID: <20161212160711.RKIOtFpIh_WGXqcJidaSVJTyoHK823-N4bBLwciQjd0@z>

On Sun, Dec 11, 2016 at 11:01:48PM +0100, Wolfram Sang wrote:
> On Fri, Dec 09, 2016 at 10:31:57AM +0100, Jan Glauber wrote:
> > Do not infinitely retry register readq and writeq operations
> > in order to not lock up the CPU in case the TWSI gets stuck.
> > 
> > Return -EIO in case of a failed data read. For all other
> > cases just return so subsequent operations will fail
> > and trigger the recovery.
> > 
> > Signed-off-by: Jan Glauber <jglauber@cavium.com>
> 
> I can't apply this one?
> 

Strange. Applies for me on top of 4.9 and also next-20161212.
I can also apply if back from the mail. Is the mail messed up on your
side?
