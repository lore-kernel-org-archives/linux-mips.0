Received: from mail-wm0-x244.google.com ([IPv6:2a00:1450:400c:c09::244]:51917
        "EHLO mail-wm0-x244.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992553AbeFYSHC3-Ane (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 25 Jun 2018 20:07:02 +0200
Received: by mail-wm0-x244.google.com with SMTP id w137-v6so4972684wmw.1
        for <linux-mips@linux-mips.org>; Mon, 25 Jun 2018 11:07:02 -0700 (PDT)
Subject: Re: [PATCH 10/25] dt-bindings: PCI: qcom,ar7100: adds binding doc
References: <20180625171549.4618-1-john@phrozen.org>
 <20180625171549.4618-11-john@phrozen.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <5926a597-b2fd-47f8-3a58-bf05d0b7da97@cogentembedded.com>
Date: Mon, 25 Jun 2018 21:06:54 +0300
MIME-Version: 1.0
In-Reply-To: <20180625171549.4618-11-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Return-Path: <sergei.shtylyov@cogentembedded.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: John Crispin <john@phrozen.org>, James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org

On 06/25/2018 08:15 PM, John Crispin wrote:

> With the driver being converted from platform_data to pure OF, we need to
> also add some docs.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  .../devicetree/bindings/pci/qcom,ar7100-pci.txt    | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/qcom,ar7100-pci.txt
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,ar7100-pci.txt b/Documentation/devicetree/bindings/pci/qcom,ar7100-pci.txt
> new file mode 100644
> index 000000000000..97be7b0c4cf9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/qcom,ar7100-pci.txt
> @@ -0,0 +1,36 @@
> +* Qualcomm Atheros AR7100 PCI express root complex
> +
> +Required properties:
> +- compatible: should contain "qcom,ar7100-pci" to identify the core.
> +- reg: Should contain the register ranges as listed in the reg-names property.
> +- reg-names: Definition: Must include the following entries
> +	- "cfg_base"	IO Memory
> +- #address-cells: set to <3>
> +- #size-cells: set to <2>
> +- ranges: ranges for the PCI memory and I/O regions
> +- interrupt-map-mask and interrupt-map: standard PCI
> +	properties to define the mapping of the PCIe interface to interrupt
> +	numbers.
> +- #interrupt-cells: set to <1>
> +- interrupt-parent: phandle to the MIPS IRQ controller

   Never a required prop, can be "inherited" from the parent node.

> +- interrupt-controller: define to enable the builtin IRQ cascade.
> +
> +* Example for ar7100
> +	pcie0: pcie-controller@180c0000 {

   Name it just "pcie@180c0000", please.

[...]

MBR, Sergei
