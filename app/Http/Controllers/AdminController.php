<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use App\Models\Question;
use App\Models\Report;

class AdminController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth')->except('logout');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = [
            'userCount'     => User::count(),
            'reportCount'   => Report::count(),
            'questionCount' => Question::count(),
        ];

        return view('admin.dashboard', $data);
    }

    public function register(Request $request)
    {
        $user = new User;
        $user->name = ucwords(strtolower($request->name));
        $user->email = strtolower($request->email);
        $user->password = Hash::make($request->password);
        $user->email_verified_at = \Carbon\Carbon::now();
        if ($user->save()) {
            return redirect()->route('admin.login');
        }
    }
}
