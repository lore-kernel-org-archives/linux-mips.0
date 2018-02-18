Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:46279 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992828AbeBRWHqa8g4n (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 18 Feb 2018 23:07:46 +0100
Date: Sun, 18 Feb 2018 14:09:01 -0800
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH v5 00/14] net: pch_gbe: Fixes & MIPS support
Message-ID: <20180218220901.lyer5ovlbid6ew6p@pburton-laptop>
References: <20180217201037.3006-1-paul.burton@mips.com>
 <20180218.103112.1461192916516173265.davem@davemloft.net>
 <20180218170310.lpwjtnxe6awrhgen@pburton-laptop>
 <20180218175607.GB31083@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180218175607.GB31083@lunn.ch>
Return-Path: <Paul.Burton@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Andrew Lunn <andrew@lunn.ch>
Cc: David Miller <davem@davemloft.net>, netdev@vger.kernel.org, hassan.naveed@mips.com, matt.redfearn@mips.com, linux-mips@linux-mips.org
Message-ID: <20180218220901.fy44h389Zd3xqw-VVLqGn-SsRNr96XHgvpNobyUpqos@z>

Hi Andrew,

On Sun, Feb 18, 2018 at 06:56:07PM +0100, Andrew Lunn wrote:
> On Sun, Feb 18, 2018 at 09:03:10AM -0800, Paul Burton wrote:
> > Hi David,
> > 
> > On Sun, Feb 18, 2018 at 10:31:12AM -0500, David Miller wrote:
> > > Nobody is going to see and apply these patches if you don't CC: the
> > > Linux networking development list, netdev@vger.kernel.org
> > 
> > You're replying to mail that was "To: netdev@vger.kernel.org" and I see
> > the whole series in the archives[1] so it definitely reached the list.
> > 
> > I'm not sure I see the problem?
> 
> Hi Paul
> 
> I'm guess that David is wondering about version 1-4 of this patchset?
> As far as i can see, they were sent to the mips list, not the netdev
> list.

It has been quite a while since v4, but it and earlier revisions were
submitted to the netdev list too:

v4: https://www.spinics.net/lists/netdev/msg438550.html
v3: https://www.spinics.net/lists/netdev/msg438313.html
v2: https://marc.info/?l=linux-netdev&m=145450117711515&w=2

v1 was part of a larger series, but netdev was also copied on the
relevant patches starting here & the patches following it:

v1: https://marc.info/?l=linux-netdev&m=144890083511222&w=2

Thanks,
    Paul
