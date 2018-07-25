Received: from mail.kernel.org ([198.145.29.99]:53046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23992960AbeGYXnhbf463 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 26 Jul 2018 01:43:37 +0200
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180722212010.3979-16-afaerber@suse.de>
References: <20180722212010.3979-1-afaerber@suse.de>
 <20180722212010.3979-16-afaerber@suse.de>
Message-ID: <153256221029.48062.5074371246522411479@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 15/15] clk: pistachio: Fix wrong SDHost card speed
Date: Wed, 25 Jul 2018 16:43:30 -0700
Return-Path: <sboyd@kernel.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, linux-kernel@vger.kernel.org, Govindraj Raja <Govindraj.Raja@imgtec.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Message-ID: <20180725234330.C_xnSTn1-rUgTxpHOlxGjbT7Ar0VRqH91eo0vJpAcOo@z>

Quoting Andreas Färber (2018-07-22 14:20:10)
> From: Govindraj Raja <Govindraj.Raja@imgtec.com>
> 
> The SDHost currently clocks the card 4x slower than it
> should do, because there is a fixed divide by 4 in the
> sdhost wrapper that is not present in the clock tree.
> To model this, add a fixed divide by 4 clock node in
> the SDHost clock path.
> 
> This will ensure the right clock frequency is selected when
> the mmc driver tries to configure frequency on card insert.
> 
> Signed-off-by: Govindraj Raja <Govindraj.Raja@imgtec.com>
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
