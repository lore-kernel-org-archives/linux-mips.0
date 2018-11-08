Received: from mail.kernel.org ([198.145.29.99]:39824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23991062AbeKHSTiZRXG8 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 8 Nov 2018 19:19:38 +0100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1540971702-3133-3-git-send-email-wang.yi59@zte.com.cn>
References: <1540971702-3133-1-git-send-email-wang.yi59@zte.com.cn>
 <1540971702-3133-3-git-send-email-wang.yi59@zte.com.cn>
Message-ID: <154170117680.88331.2861577211813532009@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 2/2] clk: boston: unregister clks on failure in
 clk_boston_setup()
Date: Thu, 08 Nov 2018 10:19:36 -0800
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
Message-ID: <20181108181936.JB2BGK_ezuJRGemAPjIKHcyO6G9Ms6D_943Aic8LMnU@z>

Quoting Yi Wang (2018-10-31 00:41:42)
> The registered clks should unregister when something wrong happens
> before going out in function clk_boston_setup().
> 
> Signed-off-by: Yi Wang <wang.yi59@zte.com.cn>
> ---

Applied to clk-next
