Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id AB8651BC;
	Tue,  5 Dec 2023 10:01:44 -0800 (PST)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rAZjr-0003nO-00; Tue, 05 Dec 2023 19:01:43 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id BCBD4C0A2B; Tue,  5 Dec 2023 18:52:36 +0100 (CET)
Date: Tue, 5 Dec 2023 18:52:36 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	linux-kernel@vger.kernel.org,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	Aurelien Jarno <aurel32@debian.org>
Subject: Re: [PATCH] MIPS: kernel: Clear FPU states when setting up kernel
 threads
Message-ID: <ZW9jZDTkw3T9dBtS@alpha.franken.de>
References: <20231130163601.185270-1-tsbogend@alpha.franken.de>
 <6f290f4b-5dc2-44f3-9f2d-01496f78d629@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f290f4b-5dc2-44f3-9f2d-01496f78d629@app.fastmail.com>

On Fri, Dec 01, 2023 at 11:12:21AM +0000, Jiaxun Yang wrote:
> 
> 
> 在2023年11月30日十一月 下午4:36，Thomas Bogendoerfer写道：
> > io_uring sets up the io worker kernel thread via a syscall out of an
> > user space prrocess. This process might have used FPU and since
> > copy_thread() didn't clear FPU states for kernel threads a BUG()
> > is triggered for using FPU inside kernel. Move code around
> > to always clear FPU state for user and kernel threads.
> >
> > Cc: stable@vger.kernel.org
> > Reported-by: Aurelien Jarno <aurel32@debian.org>
> > Closes: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1055021
> > Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> 
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> 
> Perhaps
> Suggested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> 
> As well :-)

I've added both

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
