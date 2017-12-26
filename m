Received: from mail-pf0-f193.google.com ([209.85.192.193]:35994 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990439AbdLZVsTdzgZL (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 26 Dec 2017 22:48:19 +0100
Received: by mail-pf0-f193.google.com with SMTP id p84so19107776pfd.3
        for <linux-mips@linux-mips.org>; Tue, 26 Dec 2017 13:48:19 -0800 (PST)
Date: Tue, 26 Dec 2017 15:48:10 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: Document mti,mips-cpc binding
Message-ID: <20171226214810.su23px4ue7q5t3xg@rob-hp-laptop>
References: <1513869627-15391-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1513869627-15391-2-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1513869627-15391-2-git-send-email-aleksandar.markovic@rt-rk.com>
Return-Path: <robherring2@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Cc: linux-mips@linux-mips.org, Paul Burton <paul.burton@mips.com>, Aleksandar Markovic <aleksandar.markovic@mips.com>, devicetree@vger.kernel.org, Douglas Leung <douglas.leung@mips.com>, Goran Ferenc <goran.ferenc@mips.com>, James Hogan <james.hogan@mips.com>, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Miodrag Dinic <miodrag.dinic@mips.com>, Petar Jovanovic <petar.jovanovic@mips.com>, Raghu Gandham <raghu.gandham@mips.com>

On Thu, Dec 21, 2017 at 04:20:23PM +0100, Aleksandar Markovic wrote:
> From: Paul Burton <paul.burton@mips.com>
> 
> Document a binding for the MIPS Cluster Power Controller (CPC) which
> simply allows the device tree to specify where the CPC registers are
> located.
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> Signed-off-by: Aleksandar Markovic <aleksandar.markovic@mips.com>
> ---
>  Documentation/devicetree/bindings/misc/mti,mips-cpc.txt | 8 ++++++++

power controllers are usually documented under bindings/power/

>  1 file changed, 8 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/mti,mips-cpc.txt
> 
> diff --git a/Documentation/devicetree/bindings/misc/mti,mips-cpc.txt b/Documentation/devicetree/bindings/misc/mti,mips-cpc.txt
> new file mode 100644
> index 0000000..c6b8251
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/mti,mips-cpc.txt
> @@ -0,0 +1,8 @@
> +Binding for MIPS Cluster Power Controller (CPC).
> +
> +This binding allows a system to specify where the CPC registers are
> +located.
> +
> +Required properties:
> +compatible : Should be "mti,mips-cpc".
> +regs: Should describe the address & size of the CPC register region.
> -- 
> 2.7.4
> 
