Received: from multi.imgtec.com ([194.200.65.239]:34300 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6822344Ab3HLP7t1ifwH (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 12 Aug 2013 17:59:49 +0200
Message-ID: <52090650.3000309@imgtec.com>
Date: Mon, 12 Aug 2013 16:59:12 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: add driver for the built-in PCI controller of the
 RT3883 SoC
References: <1376064212-28415-1-git-send-email-juhosg@openwrt.org>
In-Reply-To: <1376064212-28415-1-git-send-email-juhosg@openwrt.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Gabor Juhos <juhosg@openwrt.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, John Crispin <blogic@openwrt.org>, devicetree@vger.kernel.org
Message-ID: <20130812155912.H7NDf7WSR_J-1ylyJNyxLwCZgkCmQvy3pVhFbsaG6Vg@z>

On 09/08/13 17:03, Gabor Juhos wrote:
> +   - status: either "disabled" or "okay"

Is this really a required property? If it's using the generic code for
it then I think it will be treated as "okay" if omitted. In any case I
don't think this property is normally documented in these bindings docs
(I couldn't find any other instances of it).

Cheers
James
