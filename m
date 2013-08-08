Received: from multi.imgtec.com ([194.200.65.239]:50106 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6817904Ab3HHOsMnaZAX (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 8 Aug 2013 16:48:12 +0200
Message-ID: <5203AF83.30101@imgtec.com>
Date: Thu, 8 Aug 2013 15:47:31 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] serial: MIPS: lantiq: add clk_enable() call to driver
References: <1375968687-8704-1-git-send-email-blogic@openwrt.org>
In-Reply-To: <1375968687-8704-1-git-send-email-blogic@openwrt.org>
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
To: John Crispin <blogic@openwrt.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-serial@vger.kernel.org, linux-mips@linux-mips.org, Thomas Langer <thomas.langer@lantiq.com>
Message-ID: <20130808144731.RIx5pLLhiPcnjwLhB3M4TROkuaHG9LQryTLhf3uvvzU@z>

On 08/08/13 14:31, John Crispin wrote:
> From: Thomas Langer <thomas.langer@lantiq.com>
> 
> Enable the clock if one is present when setting up the console.
> 
> Signed-off-by: Thomas Langer <thomas.langer@lantiq.com>
> Acked-by: John Crispin <blogic@openwrt.org>
> ---
>  drivers/tty/serial/lantiq.c |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/tty/serial/lantiq.c b/drivers/tty/serial/lantiq.c
> index 15733da..ce1ea35 100644
> --- a/drivers/tty/serial/lantiq.c
> +++ b/drivers/tty/serial/lantiq.c
> @@ -636,6 +636,9 @@ lqasc_console_setup(struct console *co, char *options)
>  
>  	port = &ltq_port->port;
>  
> +	if (ltq_port->clk)

I think that should be !IS_ERR(ltq_port->clk)? The same problem appears
to be elsewhere in that file too.

Cheers
James
