Received: from mailapp01.imgtec.com ([195.89.28.114]:64399 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-FAIL-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S6835371AbaEGJprXFRSd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 May 2014 11:45:47 +0200
Message-ID: <536A00C3.9020701@imgtec.com>
Date: Wed, 7 May 2014 10:45:39 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: Introduce the use of the managed version of kzalloc
References: <20140507044211.GA3158@himangi-Dell>
In-Reply-To: <20140507044211.GA3158@himangi-Dell>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Himangi Saraogi <himangi774@gmail.com>, ralf@linux-mips.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Cc: julia.lawall@lip6.fr
Message-ID: <20140507094539.R8Gn8aG5jCS0ctqYw0uPw0khu4Zmvr5rChpXly1_MFc@z>

Hi,

On 05/07/2014 05:43 AM, Himangi Saraogi wrote:
> This patch moves data allocated using kzalloc to managed data allocated
> using devm_kzalloc and cleans now unnecessary kfrees in probe and remove
> functions.The labels out and out_mem are also removed as they are no
> longer required.
> 
> The following Coccinelle semantic patch was used for making the change:
> [..]
> 
> Signed-off-by: Himangi Saraogi <himangi774@gmail.com>
> ---
>  arch/mips/mti-sead3/sead3-i2c-drv.c | 37 ++++++++++++++-----------------------
>  1 file changed, 14 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/mips/mti-sead3/sead3-i2c-drv.c b/arch/mips/mti-sead3/sead3-i2c-drv.c
> index 1f787a6..4d72e0e 100644
> --- a/arch/mips/mti-sead3/sead3-i2c-drv.c
> +++ b/arch/mips/mti-sead3/sead3-i2c-drv.c
> @@ -304,22 +304,18 @@ static int sead3_i2c_platform_probe(struct platform_device *pdev)
>  	int ret;
>[...]
> -	return ret;
> +	if (ret)
> +		return ret;
> +	
     ^^^^ trailing whitespace

Apart from that, the patch seems to be ok. Thanks!

Tested-by: Markos Chandras <markos.chandras@imgtec.com>
Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>

-- 
markos
