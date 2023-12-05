Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id AA5FC122;
	Tue,  5 Dec 2023 10:01:44 -0800 (PST)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rAZjr-0003nM-00; Tue, 05 Dec 2023 19:01:43 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 97F56C028A; Tue,  5 Dec 2023 18:51:31 +0100 (CET)
Date: Tue, 5 Dec 2023 18:51:31 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Aurelien Jarno <aurel32@debian.org>
Subject: Re: [PATCH] MIPS: kernel: Clear FPU states when setting up kernel
 threads
Message-ID: <ZW9jI7gZRv/+qEce@alpha.franken.de>
References: <20231130163601.185270-1-tsbogend@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130163601.185270-1-tsbogend@alpha.franken.de>

On Thu, Nov 30, 2023 at 05:36:01PM +0100, Thomas Bogendoerfer wrote:
> io_uring sets up the io worker kernel thread via a syscall out of an
> user space prrocess. This process might have used FPU and since
> copy_thread() didn't clear FPU states for kernel threads a BUG()
> is triggered for using FPU inside kernel. Move code around
> to always clear FPU state for user and kernel threads.
> 
> Cc: stable@vger.kernel.org
> Reported-by: Aurelien Jarno <aurel32@debian.org>
> Closes: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1055021
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/kernel/process.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
