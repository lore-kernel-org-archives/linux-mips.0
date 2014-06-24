Received: from mailapp01.imgtec.com ([195.59.15.196]:44983 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6860427AbaFXKNltaEyG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 24 Jun 2014 12:13:41 +0200
Message-ID: <53A94F4D.10605@imgtec.com>
Date: Tue, 24 Jun 2014 11:13:33 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2] arch/mips rb532: replace mac_addr parsing
References: <20140624084540.GA22930@google.com>
In-Reply-To: <20140624084540.GA22930@google.com>
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
To: Daniel Walter <dwalter@google.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20140624101333.JaGxc426iwZfjGdgQFtlZ8Ovgooak5FCIQ___wgBNS4@z>

Hi Daniel,

On 24/06/14 09:45, Daniel Walter wrote:
> @@ -333,7 +311,13 @@ static int __init plat_setup_devices(void)
>  static int __init setup_kmac(char *s)
>  {
>  	printk(KERN_INFO "korina mac = %s\n", s);
> -	parse_mac_addr(s);
> +	sscanf(s, "%hhx:%hhx:%hhx:%hhx:%hhx:%hhx",
> +			&korina_dev0_data.mac[0],
> +			&korina_dev0_data.mac[1],
> +			&korina_dev0_data.mac[2],
> +			&korina_dev0_data.mac[3],
> +			&korina_dev0_data.mac[4],
> +			&korina_dev0_data.mac[5]);

Does it make sense to go one better and use mac_pton() for this?

Cheers
James
