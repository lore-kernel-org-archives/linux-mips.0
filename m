Received: from multi.imgtec.com ([194.200.65.239]:12591 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6822429Ab3IKLMmdE8pK (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 11 Sep 2013 13:12:42 +0200
Message-ID: <52304FD2.8030602@imgtec.com>
Date: Wed, 11 Sep 2013 12:11:14 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2] MIPS: do not allow building vmlinuz when !ZBOOT
References: <1378895688-16641-1-git-send-email-f.fainelli@gmail.com>
In-Reply-To: <1378895688-16641-1-git-send-email-f.fainelli@gmail.com>
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
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, blogic@openwrt.org, richard@nod.at
Message-ID: <20130911111114.TL9pswJaByEMIH3fh5v8Rt4LBkzf9KivmsexxcNVdvY@z>

Hi Florian

On 11/09/13 11:34, Florian Fainelli wrote:
> +vmlinuz: FORCE
> +	@echo '   CONFIG_SYS_SUPPORTS_ZBOOT is not enabled'; \
> +	/bin/false

Nit: You don't really need the echo and /bin/false as part of the same
command (i.e. the "; \" at end of echo), but no big deal.

Reviewed-by: James Hogan <james.hogan@imgtec.com>

Cheers
James
