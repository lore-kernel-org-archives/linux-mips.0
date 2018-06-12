Received: from smtprelay.synopsys.com ([198.182.47.9]:48889 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992618AbeFLOvcOrz2e (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 12 Jun 2018 16:51:32 +0200
Subject: Re: [PATCH 3/3 RFC] Revert "net: stmmac: fix build failure due to
 missing COMMON_CLK dependency"
References: <1528706663-20670-1-git-send-email-geert@linux-m68k.org>
 <1528706663-20670-4-git-send-email-geert@linux-m68k.org>
From: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <1a1f3bea-1680-ce1c-09cb-0d5e2b4531d1@synopsys.com>
Date: Tue, 12 Jun 2018 15:51:15 +0100
MIME-Version: 1.0
In-Reply-To: <1528706663-20670-4-git-send-email-geert@linux-m68k.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <Jose.Abreu@synopsys.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Corentin Labbe <clabbe@baylibre.com>, "David S . Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org, linux-mips@linux-mips.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <20180612145115.uS_lrGpqIpkc9qYJ8YAcoilmOMaTMJvnr6bffRD14xA@z>

Hi,

On 11-06-2018 09:44, Geert Uytterhoeven wrote:
> This reverts commit bde4975310eb1982bd0bbff673989052d92fd481.
>
> All legacy clock implementations now implement clk_set_rate() (Some
> implementations may be dummies, though).
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>

This seems okay by me. You can send a non-rfc patch with my ack
once other 2 patches get accepted:

Acked-by: Jose Abreu <joabreu@synopsys.com>

Thanks and Best Regards,
Jose Miguel Abreu
