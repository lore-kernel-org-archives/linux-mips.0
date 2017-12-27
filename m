Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:57449 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990474AbdL0N5uPUXI0 convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 27 Dec 2017 14:57:50 +0100
From: Aleksandar Markovic <Aleksandar.Markovic@mips.com>
Subject: RE: [PATCH v2 1/2] dt-bindings: Document mti,mips-cpc binding
Date: Wed, 27 Dec 2017 13:56:12 +0000
Message-ID: <BD3A5F1946F2E540A31AF2CE969BAEEEC28299@MIPSMAIL01.mipstec.com>
References: <1513869627-15391-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1513869627-15391-2-git-send-email-aleksandar.markovic@rt-rk.com>,<20171226214810.su23px4ue7q5t3xg@rob-hp-laptop>
In-Reply-To: <20171226214810.su23px4ue7q5t3xg@rob-hp-laptop>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <Aleksandar.Markovic@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Rob Herring <robh@kernel.org>, Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Paul Burton <Paul.Burton@mips.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Douglas Leung <Douglas.Leung@mips.com>, Goran Ferenc <Goran.Ferenc@mips.com>, James Hogan <James.Hogan@mips.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Miodrag Dinic <Miodrag.Dinic@mips.com>, Petar Jovanovic <Petar.Jovanovic@mips.com>, Raghu Gandham <Raghu.Gandham@mips.com>
Message-ID: <20171227135612.cuBkuBLBhkffFrCSO-MriJhqgThX5KQTHRiKLs4i8Tg@z>

Hi, Rob.

Thanks for the review.

> From: Rob Herring [robh@kernel.org]
> Sent: Tuesday, December 26, 2017 10:48 PM
> To: Aleksandar Markovic
> > On Thu, Dec 21, 2017 at 04:20:23PM +0100, Aleksandar Markovic wrote:
> > From: Paul Burton <paul.burton@mips.com>
> >
> > Document a binding for the MIPS Cluster Power Controller (CPC) which
> > simply allows the device tree to specify where the CPC registers are
> > located.
> >
> > Signed-off-by: Paul Burton <paul.burton@mips.com>
> > Signed-off-by: Aleksandar Markovic <aleksandar.markovic@mips.com>
> > ---
> >  Documentation/devicetree/bindings/misc/mti,mips-cpc.txt | 8 ++++++++
> 
> power controllers are usually documented under bindings/power/

I am going to change the file location to Documentation/devicetree/bindings/power
in v3, unless someone objects.

Regards,
Aleksandar
