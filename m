Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:43400 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990723AbeDKRGTTKBfJ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 11 Apr 2018 19:06:19 +0200
Date: Wed, 11 Apr 2018 18:04:33 +0100
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH v3 2/2] MIPS: io: add a barrier after register read in
 readX()
In-Reply-To: <20180406212601.GA1730@saruman>
Message-ID: <alpine.DEB.2.00.1804111756420.1545@tp.orcam.me.uk>
References: <1522760109-16497-1-git-send-email-okaya@codeaurora.org> <1522760109-16497-2-git-send-email-okaya@codeaurora.org> <41e184ae-689e-93c9-7b15-0c68bd624130@codeaurora.org> <b748fdcb-e09f-9fe3-dc74-30b6a7d40cbe@codeaurora.org>
 <20180406212601.GA1730@saruman>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <jhogan@kernel.org>
Cc: Sinan Kaya <okaya@codeaurora.org>, linux-mips@linux-mips.org, arnd@arndb.de, timur@codeaurora.org, sulrich@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, linux-kernel@vger.kernel.org
Message-ID: <20180411170433.xE9m2N2NRxjrzvX9rTV139xB9ILq58kAKGZYk24szFo@z>

Hi James,

> > Any news on the MIPS front? Is this something that Arnd can merge? or does it have
> > to go through the MIPS tree.
> 
> It needs some MIPS input really. I'll try and take a look soon. Thanks
> for the nudge.
> 
> > It feels like the MIPS is dead since nobody replied to me in the last few weeks on
> > a very important topic.
> 
> Not dead, just both maintainers heavily distracted by real life right
> now (which sadly, for me at least, trumps this very important topic) and
> doing the best they can given the circumstances.

 Can I help move this change forward anyhow?

  Maciej
