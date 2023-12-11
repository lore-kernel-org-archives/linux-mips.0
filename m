Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id B7D43CF;
	Mon, 11 Dec 2023 13:01:56 -0800 (PST)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rCnPW-0007EH-00; Mon, 11 Dec 2023 22:01:54 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id D51F5C028A; Mon, 11 Dec 2023 21:56:22 +0100 (CET)
Date: Mon, 11 Dec 2023 21:56:22 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-mips@vger.kernel.org, john@phrozen.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add myself as maintainer of the Ralink
 architecture
Message-ID: <ZXd3dhsc3HXbj7SR@alpha.franken.de>
References: <20231022090633.792831-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231022090633.792831-1-sergio.paracuellos@gmail.com>

On Sun, Oct 22, 2023 at 11:06:33AM +0200, Sergio Paracuellos wrote:
> Its been a while since I am making contributions to this architecture.
> Hence add myself as maintainer.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
> Hi John, if you are not ok with this please let me know. In other case
> please ack this patch. I can add myself as Reviewer if you prefer to
> maintain alone this.
> 
> Thanks in advance for your time!
> 
> Best regards,
>     Sergio Paracuellos
> 
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2894f0777537..406c26a6f5d8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17914,6 +17914,7 @@ F:	drivers/media/cec/usb/rainshadow/
>  
>  RALINK MIPS ARCHITECTURE
>  M:	John Crispin <john@phrozen.org>
> +M:	Sergio Paracuellos <sergio.paracuellos@gmail.com>
>  L:	linux-mips@vger.kernel.org
>  S:	Maintained
>  F:	arch/mips/ralink
> -- 
> 2.25.1

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
