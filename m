Received: from multi.imgtec.com ([194.200.65.239]:29745 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6822678Ab3H2MyIdrViU (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 29 Aug 2013 14:54:08 +0200
Message-ID: <521F4469.6020507@imgtec.com>
Date: Thu, 29 Aug 2013 13:54:01 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: do not allow building vmlinuz when !ZBOOT
References: <1377704569-21331-1-git-send-email-f.fainelli@gmail.com>
In-Reply-To: <1377704569-21331-1-git-send-email-f.fainelli@gmail.com>
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
Message-ID: <20130829125401.gaAaE7dVorm3tioariLAztlAUcpa9YbejJcUR5aahYQ@z>

Hi Florian,

On 28/08/13 16:42, Florian Fainelli wrote:
> +ifdef CONFIG_SYS_SUPPORTS_ZBOOT
>  # boot/compressed
>  vmlinuz vmlinuz.bin vmlinuz.ecoff vmlinuz.srec: $(vmlinux-32) FORCE
>  	$(Q)$(MAKE) $(build)=arch/mips/boot/compressed \
>  	   VMLINUX_LOAD_ADDRESS=$(load-y) 32bit-bfd=$(32bit-bfd) $@
> +else
> +vmlinuz:

Does this need a dependency on FORCE so that if you switched config and
had a valid vmlinuz lying around it doesn't do nothing as a result of
vmlinuz having no dependencies and existing?

> +	@echo '   CONFIG_SYS_SUPPORTS_ZBOOT is not enabled'

Also it may be worth adding false here too so that make's exit code
reports failure correctly.

Cheers
James
