Received: from mailapp01.imgtec.com ([195.59.15.196]:54950 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27028500AbcEMKDSGiSEP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 13 May 2016 12:03:18 +0200
Subject: Re: [PATCH] MIPS: tools: Ignore relocation tool
References: <1462994177-6460-1-git-send-email-f.fainelli@gmail.com>
From: Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <5735A65F.8080006@imgtec.com>
Date: Fri, 13 May 2016 11:03:11 +0100
MIME-Version: 1.0
In-Reply-To: <1462994177-6460-1-git-send-email-f.fainelli@gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Florian Fainelli <f.fainelli@gmail.com>, linux-mips@linux-mips.org
Cc: ralf@linux-mips.org
Message-ID: <20160513100311.rYD7mjRumAv-qbc6VwM2UIisV4NgSNW7ezoWb95XNKA@z>

Good spot Florian.

Acked-by: Matt Redfearn <matt.redfearn@imgtec.com>

On 11/05/16 20:16, Florian Fainelli wrote:
> Add a .gitignore ignoring arch/mips/boot/tools/relocs.
>
> Fixes: 5f552da15721 ("MIPS: tools: Add relocs tool")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>   arch/mips/boot/tools/.gitignore | 1 +
>   1 file changed, 1 insertion(+)
>   create mode 100644 arch/mips/boot/tools/.gitignore
>
> diff --git a/arch/mips/boot/tools/.gitignore b/arch/mips/boot/tools/.gitignore
> new file mode 100644
> index 000000000000..be0ed065249b
> --- /dev/null
> +++ b/arch/mips/boot/tools/.gitignore
> @@ -0,0 +1 @@
> +relocs
