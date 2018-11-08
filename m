Received: from mail.kernel.org ([198.145.29.99]:39688 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23990429AbeKHSTbwzgN8 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 8 Nov 2018 19:19:31 +0100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1540971702-3133-2-git-send-email-wang.yi59@zte.com.cn>
References: <1540971702-3133-1-git-send-email-wang.yi59@zte.com.cn>
 <1540971702-3133-2-git-send-email-wang.yi59@zte.com.cn>
Message-ID: <154170116960.88331.164103375264551287@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 1/2] clk: boston: fix possible memory leak in
 clk_boston_setup()
Date: Thu, 08 Nov 2018 10:19:29 -0800
Return-Path: <sboyd@kernel.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Yi Wang <wang.yi59@zte.com.cn>, paul.burton@mips.com
Cc: mturquette@baylibre.com, linux-mips@linux-mips.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, zhong.weidong@zte.com.cn
Message-ID: <20181108181929.NLU3jC7FTCpWn-tppGmAE2aZ8RjLGH0vXJPDsYF_6eg@z>

Quoting Yi Wang (2018-10-31 00:41:41)
> Smatch report warnings:
> drivers/clk/imgtec/clk-boston.c:76 clk_boston_setup() warn: possible memory leak of 'onecell'
> drivers/clk/imgtec/clk-boston.c:83 clk_boston_setup() warn: possible memory leak of 'onecell'
> drivers/clk/imgtec/clk-boston.c:90 clk_boston_setup() warn: possible memory leak of 'onecell'
> 
> 'onecell' is malloced in clk_boston_setup(), but not be freed
> before leaving from the error handling cases.
> 
> Signed-off-by: Yi Wang <wang.yi59@zte.com.cn>
> ---

Applied to clk-next
