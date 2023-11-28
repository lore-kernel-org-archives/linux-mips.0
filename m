Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9B0BACC;
	Tue, 28 Nov 2023 01:14:58 -0800 (PST)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1r7uBE-0007T6-00; Tue, 28 Nov 2023 10:14:56 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A4070C0136; Tue, 28 Nov 2023 10:00:24 +0100 (CET)
Date: Tue, 28 Nov 2023 10:00:24 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Wujie Duan <wjduan@linx-info.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Mark symbols static where possible for mips/kernel
Message-ID: <ZWWsKBmjMKYZtWpu@alpha.franken.de>
References: <20231128071225.801111-1-wjduan@linx-info.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128071225.801111-1-wjduan@linx-info.com>

On Tue, Nov 28, 2023 at 03:12:25PM +0800, Wujie Duan wrote:
> We get 1 error when building kernel with -Werror=missing-prototypes

check git grep setup_sigcontext arch/mips/

With this patch n32 support doesn't build. We need a prototype in a header
to fix that.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
