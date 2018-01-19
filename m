Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:34264 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990604AbeASPJZfkRTZ convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 19 Jan 2018 16:09:25 +0100
From: Aleksandar Markovic <Aleksandar.Markovic@mips.com>
Subject: RE: [PATCH v3 1/2] dt-bindings: Document mti,mips-cpc binding
Date: Fri, 19 Jan 2018 15:07:48 +0000
Message-ID: <BD3A5F1946F2E540A31AF2CE969BAEEE12393C77@MIPSMAIL01.mipstec.com>
References: <1514385475-23921-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1514385475-23921-2-git-send-email-aleksandar.markovic@rt-rk.com>,<20180118222603.GG27409@jhogan-linux.mipstec.com>
In-Reply-To: <20180118222603.GG27409@jhogan-linux.mipstec.com>
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
To: James Hogan <James.Hogan@mips.com>, Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Paul Burton <Paul.Burton@mips.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Douglas Leung <Douglas.Leung@mips.com>, Goran Ferenc <Goran.Ferenc@mips.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Miodrag Dinic <Miodrag.Dinic@mips.com>, Petar Jovanovic <Petar.Jovanovic@mips.com>, Raghu Gandham <Raghu.Gandham@mips.com>, Rob Herring <robh+dt@kernel.org>
Message-ID: <20180119150748.0Xfj3qPRsRa795eN5xqfGbvy_J9K3PiAUn3DZCAboik@z>

> On Wed, Dec 27, 2017 at 03:37:51PM +0100, Aleksandar Markovic wrote:
> > From: Paul Burton <paul.burton@mips.com>
> >
> > Document a binding for the MIPS Cluster Power Controller (CPC) that
> > allows the device tree to specify where the CPC registers are located.
> >
> > Signed-off-by: Paul Burton <paul.burton@mips.com>
> > Signed-off-by: Aleksandar Markovic <aleksandar.markovic@mips.com>
> > ---
> >  Documentation/devicetree/bindings/power/mti,mips-cpc.txt | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/power/mti,mips-cpc.txt
> >
> > diff --git a/Documentation/devicetree/bindings/power/mti,mips-cpc.txt b/Documentation/devicetree/bindings/power/mti,mips-cpc.txt
> > new file mode 100644
> 
> Is it worth adding to the MIPS GENERIC PLATFORM entry of MAINTAINERS,
> given that it directly benefits it?
> 
> Cheers
> James

If nobody objects, in the v4 of this series, as a part of this particular patch, I am going to add the line:

F:       Documentation/devicetree/bindings/power/mti,mips-cpc.txt

to the following segment in MAINTAINERS file:

MIPS GENERIC PLATFORM
M:      Paul Burton <paul.burton@mips.com>
L:      linux-mips@linux-mips.org
S:      Supported
F:      arch/mips/generic/
F:      arch/mips/tools/generic-board-config.sh

v4 is planned to be sent by the end of the day.

Thanks,
Aleksandar
