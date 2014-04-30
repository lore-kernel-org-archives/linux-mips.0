Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:22644 "EHLO
        mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6843076AbaD3Jt4LYX8S (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 30 Apr 2014 11:49:56 +0200
Date: Wed, 30 Apr 2014 15:26:10 +0530
From: Jayachandran C. <jchandra@broadcom.com>
Subject: Re: [PATCH 11/17] MIPS: Netlogic: Fix XLP9XX pic entry
Message-ID: <20140430095609.GA20504@jayachandranc.netlogicmicro.com>
References: <cover.1398780013.git.jchandra@broadcom.com>
 <db9d6d674a9fadeb7bad499ade3d66cc715fb6dd.1398780013.git.jchandra@broadcom.com>
 <535FE312.50400@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <535FE312.50400@cogentembedded.com>
Return-Path: <jchandra@broadcom.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org
Message-ID: <20140430095610.FiOU3QCRieMI5SGIG5uVEoYemwRzTS6kwQiu59kYX8M@z>

On Tue, Apr 29, 2014 at 09:36:18PM +0400, Sergei Shtylyov wrote:
> Hello.
> 
> On 04/29/2014 06:37 PM, Jayachandran C wrote:
> 
> >Add the compatible property to the PIC entry. Also fix up the nodename
> >to use the correct address.
> 
> >Signed-off-by: Jayachandran C <jchandra@broadcom.com>
> >---
> >  arch/mips/netlogic/dts/xlp_gvp.dts |    5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> >diff --git a/arch/mips/netlogic/dts/xlp_gvp.dts b/arch/mips/netlogic/dts/xlp_gvp.dts
> >index 047d27f..bb4ecd1 100644
> >--- a/arch/mips/netlogic/dts/xlp_gvp.dts
> >+++ b/arch/mips/netlogic/dts/xlp_gvp.dts
> >@@ -26,11 +26,12 @@
> >  			interrupt-parent = <&pic>;
> >  			interrupts = <17>;
> >  		};
> >-		pic: pic@4000 {
> >-			interrupt-controller;
> >+		pic: pic@110000 {
> 
>    According to the ePAPR standard [1], the node name should be
> "interrupt-controller@110000".
> 
> >+			compatible = "netlogic,xlp-pic";
> >  			#address-cells = <0>;
> >  			#interrupt-cells = <1>;
> >  			reg = <0 0x110000 0x200>;
> >+			interrupt-controller;
> >  		};

The ePAPR document itself has a interrupt-controller definition which
uses the node name "pic". And most of the linux kernel dts files use
"pic" as well.

Based on this, I think that even if the standard recommends using
interrupt-contoller as the nodename, pic can be used as well.

Thanks,
JC.
