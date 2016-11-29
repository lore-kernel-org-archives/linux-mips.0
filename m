Received: from mail-co1nam03on0051.outbound.protection.outlook.com ([104.47.40.51]:18432
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23991859AbcK2JTs5BasR (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 29 Nov 2016 10:19:48 +0100
Date: Tue, 29 Nov 2016 10:19:28 +0100
From: Jan Glauber <jan.glauber@caviumnetworks.com>
Subject: Re: [PATCH v2 0/3] i2c: octeon: thunder: Fix i2c not working on
 Octeon
Message-ID: <20161129091928.GB29487@hardcore>
References: <1479149445-4663-1-git-send-email-jglauber@cavium.com>
 <99500824-4c63-b769-ad66-c136529b14b2@cavium.com>
 <20161122120106.GB3993@katana>
 <20161122145539.GA7716@hardcore>
 <20161128142208.GA3916@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20161128142208.GA3916@katana>
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
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: "Steven J. Hill" <Steven.Hill@cavium.com>, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, linux-mips@linux-mips.org, Paul Burton <paul.burton@imgtec.com>, David Daney <david.daney@cavium.com>
Message-ID: <20161129091928.7Y236I24ZmEVDctn6-KZ_eackoDBAm7HfMNGbXgd5W0@z>

On Mon, Nov 28, 2016 at 03:22:08PM +0100, Wolfram Sang wrote:
> 
> > > > This does not work on Octeon 71xx platforms. I will look at it more
> > > > closely tomorrow.
> > > 
> > > What's the outcome here? It seems we want a bugfix for 4.9 but this
> > > report keeps me reluctant to apply the series.
> > > 
> > 
> > Steven, did you have a chance to check which of the patches makes
> > Octeon 71xx fail?
> 
> How do we proceed with this one? Is somebody at Cavium able to contact
> Steven internally? I mentioned this on-going regression to Linus and
> said an rc8 would help us, but reading LWN it seems we shouldn't count
> on it...
> 

Hi Wolfram,

if possible we should at least revert commit 70121f7f3725. I should get
access to an Octeon 71xx board tomorrow, but I'm afraid we'll miss the
deadline for a well tested fix that works across all machines.

--Jan
