Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:50884 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994674AbeFTROYqFRCS (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 20 Jun 2018 19:14:24 +0200
Date: Wed, 20 Jun 2018 10:14:18 -0700
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH 0/5] MIPS: Clean-up DT bus probing
Message-ID: <20180620171418.43yveoh3md4kqzvw@pburton-laptop>
References: <20180619214710.22066-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180619214710.22066-1-robh@kernel.org>
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
To: Rob Herring <robh@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20180620171418.W6xePXYeFCJvtL84E8jjreAkjFns0X5m02v7yhgSlsM@z>

Hi Rob,

On Tue, Jun 19, 2018 at 03:47:05PM -0600, Rob Herring wrote:
> This is a series of clean-ups of DT bus probing calls. Generally, the 
> DT core code takes care of the default case and arches/platforms only 
> need to do their own call if they have non-default matching 
> requirements.
> 
> Rob
> 
> Rob Herring (5):
>   MIPS: octeon: use of_platform_populate to probe devices
>   MIPS: netlogic: remove unnecessary of_platform_bus_probe call
>   MIPS: bmips: remove unnecessary call to register "simple-bus"
>   MIPS: generic: remove unnecessary of_platform_populate call
>   MIPS: lantiq: remove unnecessary of_platform_default_populate call
> 
>  arch/mips/bmips/setup.c                   |  7 -------
>  arch/mips/cavium-octeon/octeon-platform.c |  2 +-
>  arch/mips/generic/init.c                  | 13 -------------
>  arch/mips/lantiq/prom.c                   |  8 --------
>  arch/mips/netlogic/xlp/dt.c               | 14 --------------
>  5 files changed, 1 insertion(+), 43 deletions(-)

Thanks - series applied to mips-next for 4.19.

Paul
