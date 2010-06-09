Received: from mx3-v2.alinto.net ([83.145.109.33]:49363 "EHLO
        mx3-v2.alinto.net" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S1491832Ab0FIOs5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 9 Jun 2010 16:48:57 +0200
Message-ID: <1276094926.4c0fa9ce566aa@www.inmano.com>
Date: Wed, 09 Jun 2010 16:48:46 +0200
From: octane indice <octane@alinto.com>
Subject: Re: Cross compiling MIPS kernel under x86
In-Reply-To: <op.vdz4mmlornd9a3@poker>
References: <1274711094.4bfa8c3675983@www.inmano.com> <AANLkTinOaPkOXm128trTQ39jNGWMcvPhVUGWSQz6hLjR@mail.gmail.com> <20100525131341.GA26500@linux-mips.org> <1274795905.4bfbd781a17fa@www.inmano.com> <20100525144400.GA30900@linux-mips.org> <1274879482.4bfd1dfa91e70@www.inmano.com> <AANLkTikbZmTWh8X4KOKLAUaJxKS5-PO39hmiTVICB5Zm@mail.gmail.com> <1274977788.4bfe9dfc7680f@www.inmano.com> <4BFEE551.8000306@gmail.com>
 <op.vdz4mmlornd9a3@poker>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: phils@windriver.comPhil Staub <phils@windriver.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20100609144846.R5YtAjg8QCOs-15QKAh-KpLxAGNUZHbtlQxzDdGLXOI@z>

En réponse à Phil Staub <phils@windriver.com> :
> In the top level Makefile, you'll find this:
> 
> # Use --build-id when available.
> LDFLAGS_BUILD_ID = $(patsubst -Wl$(comma)%,%,\
> 			      $(call cc-ldoption, -Wl$(comma)--build-id,))
> 
> Comment that out and it should fix you up.
>
Excellent. It boots. It fails next because it can't find
the root device, but I know how to manage that 


> Phil
>
Thanks
 
> -- 
> Phil Staub, Senior Member of Technical Staff, Wind River
> Direct: 702.290.0470 Fax: 702.982.0085
> 





Envoyé avec Inmano, ma messagerie renversante et gratuite : http://www.inmano.com
