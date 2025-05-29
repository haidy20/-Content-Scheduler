<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\RegisterRequest;
use App\Http\Requests\Auth\LoginRequest;
use App\Http\Requests\Auth\UpdateProfileRequest;
use App\Http\Resources\Auth\UserResource;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;

class AuthController extends Controller
{
    public function register(RegisterRequest $request)
    {
        $user = User::create($request->validated());
        $token = $user->createToken('apiToken')->plainTextToken;

        return response()->json([
            'status' => true,
            'message' => 'User registered successfully!',
            'data' => [
                'user' => new UserResource($user),
                'token' => $token
            ]
        ], 201);
    }


    public function login(LoginRequest $request)
    {
        $user = User::where('email', $request->email)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json([
                'status' => false,
                'message' => 'Invalid credentials',
                'data' => null
            ], 401);
        }

        $token = $user->createToken('apiToken')->plainTextToken;

        return response()->json([
            'status' => true,
            'message' => 'User logged in successfully!',
            'data' => [
                'user' => new UserResource($user),
                'token' => $token
            ]
        ], 200);
    }

    public function profile(Request $request)
    {
        $user = $request->user();

        if (!$user) {
            return response()->json([
                'status' => false,
                'message' => 'User not authenticated!',
                'data' => null
            ], 401);
        }
        return response()->json([
            'status' => true,
            'message' => 'User profile fetched successfully!',
            'data' => [
                'user' => new UserResource($user)
            ]
        ]);
    }


    public function updateProfile(UpdateProfileRequest $request)
    {
        $user = $request->user();

        if (!$user) {
            return response()->json([
                'status' => false,
                'message' => 'User not authenticated!',
                'data' => null
            ], 401);
        }
        $user->update($request->validated());

        return response()->json([
            'status' => true,
            'message' => 'Profile updated successfully!',
            'data' => [
                'user' => new UserResource($user)
            ]
        ]);
    }


    public function logout(Request $request)
    {
        $user = $request->user();

        if (!$user) {
            return response()->json([
                'status' => false,
                'message' => 'User not authenticated!',
                'data' => null
            ], 401);
        }

        $user->tokens()->delete();

        return response()->json([
            'status' => true,
            'message' => 'Logged out successfully!',
            'data' => null
        ]);
    }
}
